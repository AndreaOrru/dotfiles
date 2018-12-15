#!/usr/bin/env python

import os
import sys
from os import environ as env
from subprocess import check_call

import spotipy
import spotipy.oauth2 as oauth2


class Spotify:
    def __init__(self, client_id, client_secret, username, password):
        self.username = username
        self.password = password
        self.credentials = oauth2.SpotifyClientCredentials(
            client_id=client_id, client_secret=client_secret)

        self.token = self.credentials.get_access_token()
        self.client = spotipy.Spotify(auth=self.token)

    def download(self, album_id):
        tracks = self.client.album_tracks(album_id, limit=50)['items']

        check_call([
            'librespot-download',
            self.username,
            self.password,
            *(t['id'] for t in tracks),
        ])

        for t in tracks:
            os.rename(
                t['id'], '{:02}. {}.ogg'.format(
                    t['track_number'],
                    t['name'].replace('/', '-'),
                ))

    def search(self, artist):
        albums = self.client.search(
            type='album', q=f'artist:{artist}', limit=50)['albums']['items']

        albums = sorted(albums, key=lambda x: x['release_date'])
        return albums


if __name__ == '__main__':
    command = sys.argv[1]
    assert command in ('download', 'search')

    spotify = Spotify(
        env['SPOTIFY_CLIENT_ID'],
        env['SPOTIFY_CLIENT_SECRET'],
        env['SPOTIFY_USERNAME'],
        env['SPOTIFY_PASSWORD'],
    )

    if command == 'download':
        album_id = sys.argv[2]
        spotify.download(album_id)
    elif command == 'search':
        artist = ' '.join(sys.argv[2:])
        albums = spotify.search(artist)

        for a in albums:
            print('{} {} ({})'.format(
                a['id'],
                a['name'],
                a['release_date'][:4],
            ))

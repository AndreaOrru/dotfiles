#!/usr/bin/env python

import os
import sys
import urllib.request
from os import environ as env
from subprocess import check_call

import spotipy
import spotipy.oauth2 as oauth2
from mutagen.oggvorbis import OggVorbis, OggVorbisHeaderError


def music_folder() -> str:
    if os.path.exists(env['HOME'] + '/Music'):
        return env['HOME'] + '/Music'
    else:
        return env['HOME'] + '/music'


class Spotify:
    def __init__(self, client_id: str, client_secret: str, username: str,
                 password: str):
        self.username = username
        self.password = password
        self.credentials = oauth2.SpotifyClientCredentials(
            client_id=client_id, client_secret=client_secret)

        self.token = self.credentials.get_access_token()
        self.client = spotipy.Spotify(auth=self.token)

    def download_album(self, album_id: str) -> None:
        artist_name, album, discs, tracks = self._info_from_album(album_id)

        self._album_folder(artist_name, album, discs)
        self._download_cover(album)
        self._download_raw_tracks(tracks)

        for track in tracks:
            self._tag_and_rename_track(track, discs, album, artist_name)

    def search_albums(self, artist: str) -> list:
        albums = self.client.search(
            type='album', q=f'artist:{artist}', limit=50)['albums']['items']

        albums = sorted(albums, key=lambda x: x['release_date'])
        return albums

    def _info_from_album(self, album_id: str) -> tuple:
        album = self.client.album(album_id)
        artist_name = album['artists'][0]['name']
        tracks = self.client.album_tracks(album_id, limit=50)['items']
        discs = max(t['disc_number'] for t in tracks)
        return (artist_name, album, discs, tracks)

    @staticmethod
    def _album_folder(artist: str, album: dict, discs: int) -> None:
        folder = '{}/{}/({}) {}'.format(
            music_folder(),
            artist,
            album['release_date'][:4],
            album['name'],
        )
        os.makedirs(folder, exist_ok=True)
        os.chdir(folder)
        if discs > 1:
            for disc in range(1, discs + 1):
                os.makedirs(f'Disc {disc}', exist_ok=True)

    @staticmethod
    def _download_cover(album: dict) -> None:
        image_url = max(album['images'], key=lambda x: x['height'])['url']
        data = urllib.request.urlopen(image_url).read()
        with open('cover.jpg', 'wb') as f:
            f.write(data)

    def _download_raw_tracks(self, tracks: list) -> None:
        check_call([
            'librespot-download',
            self.username,
            self.password,
            *(t['id'] for t in tracks),
        ])

    def _tag_and_rename_track(self, track: dict, discs: int, album: dict,
                              artist: str) -> None:
        ogg = OggVorbis(track['id'])
        ogg['title'] = track['name']
        ogg['album'] = album['name']
        ogg['discnumber'] = str(track['disc_number'])
        ogg['tracknumber'] = str(track['track_number'])
        ogg['artist'] = artist
        ogg['date'] = album['release_date'][:4]
        try:
            ogg.save()
        except OggVorbisHeaderError:
            pass

        if discs > 1:
            prefix = 'Disc {}/'.format(track['disc_number'])
        else:
            prefix = ''

        os.rename(
            track['id'], '{}{:02} - {}.ogg'.format(
                prefix,
                track['track_number'],
                track['name'].replace('/', '-'),
            ))


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
        spotify.download_album(album_id)
    elif command == 'search':
        artist = ' '.join(sys.argv[2:])
        albums = spotify.search_albums(artist)

        for a in albums:
            print('{} ({}) {}'.format(
                a['id'],
                a['release_date'][:4],
                a['name'],
            ))

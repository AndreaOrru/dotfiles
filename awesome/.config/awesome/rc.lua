-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
local lain = require("lain")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    lain.layout.centerwork,
    awful.layout.suit.floating,
}
-- }}}

-- {{{ Helper functions
local function fa_icon(glyph)
    return '<span font-family="Font Awesome 5 Free">' .. glyph .. '</span>'
end
-- }}}

-- {{{ Wibar
-- Create a textclock widget
local mytextclock_icon = fa_icon("")
mytextclock = wibox.widget.textclock(" " .. mytextclock_icon .. " %a %b %d, %H:%M ")

-- Create a Spotify widget
myspotify, myspotify_timer = awful.widget.watch(
    { awful.util.shell, "-c", "playerctl status && playerctl metadata" },
    3,
    function(widget, stdout)
        local artist = "N/A"
        local title  = "N/A"
        local state  = string.match(stdout, "Playing") or
                       string.match(stdout, "Paused")  or "N/A"

        local pair = string.gmatch(stdout, "'[^:]+:([^']+)':[%s]<%[?([^%]>]+)%]?>")
        for k, v in pair
        do
            if     k == "artist" then artist = v:sub(2, -2)
            elseif k == "title"  then title  = v:sub(2, -2) end
        end

        if state == "N/A" then widget:set_markup('')
        else
            local icon = fa_icon("")
            if     state == "Playing" then color = beautiful.fg_playing
            elseif state == "Paused"  then color = beautiful.fg_paused  end
            widget:set_markup(' <span color="' .. color .. '">' .. icon .. " " ..
                               artist .. " - " .. title .. '</span> ')
        end
    end
)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() and c.first_tag then
                                                  c.first_tag:view_only()
                                              end
                                              -- This will also un-minimize
                                              -- the client, if needed
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
            s.mytaglist,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            myspotify,
            mytextclock,
        },
    }
end)
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    -- Awesome commands
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    -- Cycle layouts
    awful.key({ modkey,           }, "Return", function () awful.layout.inc( 1) end),
    awful.key({ modkey, "Shift"   }, "Return", function () awful.layout.inc(-1) end),

    -- History
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Move between windows/screens
    awful.key({ modkey,           }, "h", function () awful.client.focus.global_bydirection("left")  end),
    awful.key({ modkey,           }, "j", function () awful.client.focus.global_bydirection("down")  end),
    awful.key({ modkey,           }, "k", function () awful.client.focus.global_bydirection("up")    end),
    awful.key({ modkey,           }, "l", function () awful.client.focus.global_bydirection("right") end),

    awful.key({ modkey,           }, "n", function () awful.client.focus.byidx( 1) end),
    awful.key({ modkey,           }, "p", function () awful.client.focus.byidx(-1) end),

    awful.key({ modkey,           }, "o", function () awful.screen.focus_relative(1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),

    -- Shift windows
    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.global_bydirection("left")  end),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.global_bydirection("down")  end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.global_bydirection("up")    end),
    awful.key({ modkey, "Shift"   }, "l", function () awful.client.swap.global_bydirection("right") end),

    awful.key({ modkey, "Shift"   }, "n", function () awful.client.swap.byidx( 1) end),
    awful.key({ modkey, "Shift"   }, "p", function () awful.client.swap.byidx(-1) end),
    -- Resize windows
    awful.key({ modkey, "Control" }, "l", function () awful.tag.incmwfact( 0.05) end),
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incmwfact(-0.05) end),

    -- Window switcher and launcher
    awful.key({ modkey            }, "w",         function () awful.spawn("rofi -combi-modi window,drun -show combi -modi combi") end),
    -- Play/pause Spotify
    awful.key({ modkey            }, "space",     function () awful.spawn("playerctl play-pause") end),
    -- Lock screen
    awful.key({ modkey            }, "BackSpace", function () awful.spawn("i3lock -nec 999999") end),

    -- Save screenshot of selection
    awful.key({ modkey            }, "s",         function () awful.spawn.with_shell("maim -s ~/shots/$(date +%F_%H%M%S).png") end),
    -- Save screenshot of selection in the clipboard
    awful.key({ modkey, "Control" }, "s",         function () awful.spawn.with_shell("maim -s | xclip -selection clipboard -t image/png") end)
)

clientkeys = gears.table.join(
    -- Toggle fullscreen
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end),
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end),  -- Close client
    awful.key({ modkey, "Control" }, "f",      awful.client.floating.toggle                     ),  -- Toggle floating
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),  -- Move to master
    awful.key({ modkey, "Shift"   }, "o",      function (c) c:move_to_screen()               end),  -- Move to other screen
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end)   -- Toggle keep on top
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end)
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     size_hints_honor = false,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Wpa_gui",
          "pinentry",
          "veromix",
          "xtightvncviewer"},

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    -- Rounded window borders.
    c.shape = gears.shape.rounded_rect
end)

-- Disable rounded borders in fullscreen mode.
client.connect_signal("property::fullscreen", function (c)
    c.shape = c.fullscreen and gears.shape.rectangle or gears.shape.rounded_rect
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

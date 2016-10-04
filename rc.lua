--------------------------
-- Droid Awesome config --
--------------------------


-- includes configuration for powerline
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local daze = require("daze")
local vicious = require("vicious")

--function setDaze ()
--    local totalScreens = 0
--    for i = 1, screen.count() do
--        totalScreens = totalScreens + 1
--    end
--    if totalScreens == 1 then
--        return 1
--    elseif totalScreens == 2 then
--        return 2
--    end
--end

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)

function  getUpdates ()
    updateNo = assert(io.popen("checkupdates | wc -l"))
    updates = assert(io.popen("checkupdates"))
    numUpdates = updateNo:read("*a")
    actualUpdates = updates:read("*a")
    out = "Available updates: " .. numUpdates .. "\n" .. actualUpdates

    return out
end


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
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/droid/.config/awesome/themes/specy/theme.lua")
-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
--    awful.layout.suit.tile,
    daze.layout.term_bot,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    daze.layout.term_bot,
    daze.layout.term_top,
    daze.layout.term_top_flip,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier
}
-- }}}

--oops
-- {{{ Wallpaper
--if beautiful.wallpaper then
--    for s = 1, screen.count() do
--        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
--    end
--end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    totalScreens = screen.count()
    -- Each screen has its own tag table.
    tags[s] = awful.tag({  '1: work','2: web','3: programming','4: terms','5: media','6: void' }, s, layouts[1])
--end
-- }}}
--set the layout
--awful.layout.set(daze.layout.tile, tags[s][1]) 
--set master window width in percentage
--awful.tag.setmwfact(0.7, tags[s][1])
--set number of column windows
--awful.tag.setncol(1, tags[s][1])
end
 


-- {{{ Menu
-- menu for configuration or awesome
myawesomemenu = {
   { "edit rc.lua", editor_cmd .. " " .. awesome.conffile },
   { "edit theme.lua", "urxvt -e vim /home/hjf/.config/awesome/themes/specy/theme.lua" },
}
-- menu for generally used programs
myprogramsmenu = {
   { "firefox", "firefox-nightly" },
   { "weechat", "urxvt -e weechat-curses" },
   { "ncmpcpp", "urxvt -e ncmpcpp" },
   { "ranger", "urxvt -e ranger" },
   { "colors", mycolortests },
   { "nitrogen", "nitrogen" },
   { "alsamixer", "urxvt -e alsamixer" },
   { "restore walls", "nitrogen --restore" },
}
mycolortests = awful.menu({ items = { { "blocks", "urxvt -e ~/.colortests/blocks" },
                                    }
                          })
mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "programs", myprogramsmenu },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Images insertion
dayimg = wibox.widget.imagebox()
dayimg:set_image(awful.util.getdir("config") .. "/resources/day.png")


awful.util.spawn_with_shell("compton -cCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -D2 -m 0.88")
awful.util.spawn_with_shell("mpd /home/droid/.mpd.conf")
awful.util.spawn_with_shell("xscreensaver -no-splash &")
-- {{{ Vicious
-- Initialize battery widget
batwidget = wibox.widget.textbox()
--vicious.register(batwidget, vicious.widgets.bat, "<span foreground='#b682ae'> bat:</span> <span foreground='#e7fbfb'>$1$3</span> <span foreground='#332f35'>| </span>",1, "BAT0")
-- Initialize widget
datewidget = wibox.widget.textbox()
-- Register widget
vicious.register(datewidget, vicious.widgets.date, "<span foreground='#6a96b0'> day: </span><span foreground='#e7fbfb'>%b %d, %R </span>", 60)
-- Initialize widget
memwidget = wibox.widget.textbox()
-- Register widget
vicious.register(memwidget, vicious.widgets.mem, "<span foreground='#332f35'>|</span><span foreground='#7094a1'> mem: </span><span foreground='#e7fbfb'>$1% ($2MB/$3MB)</span>", 13)
-- Initialize widget
cpuwidget = wibox.widget.textbox()
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, "<span foreground='#332f35'>| </span><span foreground='#b682ae'>cpu: </span><span foreground='#e7fbfb'>$1%</span> ")
-- Initialize widget
mpdwidget = wibox.widget.textbox()
-- Register widget
vicious.register(mpdwidget, vicious.widgets.mpd,
	function (mpdwidget, args)
		if args["{state}"] == "Stop" then 
			return " - "
		else 
			return " <span foreground='#332f35'>|</span><span foreground='#6ac4a3'> mpd: </span><span foreground='#e7fbfb'>".. args["{Artist}"]..' - '.. args["{Title}"].."</span> "
		end
	end, 10)
--initialize seperator
endspace = wibox.widget.textbox(" ")
seperator = wibox.widget.textbox(" | ")
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))


function getCal ()
    calFunc = io.popen("cal")
    cal = calFunc:read("*a")
    return cal
end

 datewidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () naughty.notify({
        title = "",
        text = getCal(),
        time = 10
    })
    end)
     ))
 mpdwidget:buttons(awful.util.table.join(
    awful.button({}, 1, function() 
        os.execute("mpc toggle")
        naughty.notify({
		    title = "MPD Toggled",
		    text = mpdStat(),
		    time = 2
	    })
        end)))
                                          
for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    -- left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    
    --right_layout:add(dayimg)
    right_layout:add(batwidget)
    --date information
    right_layout:add(datewidget)
    
    
    --ram information
    right_layout:add(memwidget)
    
    --media information
    right_layout:add(mpdwidget)
    
    --cpu information
    right_layout:add(cpuwidget)


    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}



-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}
function mpdStat ()
	mpdstat = io.popen("mpc status")
	status = mpdstat:read("*a")
	return status
end
-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({                   }, "Print", function () awful.util.spawn("scrot -e 'mv $f ~/screenshots/ 2>/dev/null'") end),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
 --   awful.key({ modkey,           }, "w", function () mymainmenu:show() end),
    
--    awful.key({ modkey,           }, "w", 
--        function()
--            local wd = io.popen("pwd")
--            local wdd = wd:read("*a")
--            naughty.notify =({ 
--                preset = naughty.config.presets.critical,
--                title = "shit",
--                text  = wdd})
--        end),
        
    awful.key({ modkey,           }, "w", function () 
	    os.execute("mpc toggle")
	    naughty.notify({
		    title = "MPD Toggled",
		    text = mpdStat(),
		    time = 2
	    })
    end),
    awful.key({ modkey, "Shift"   }, "w", function()
	    os.execute("mpc next")
	    naughty.notify({
		    title = "MPD Skipped",
		    text = mpdStat(),
		    time = 2
	    })
    end),
    awful.key({ modkey,           }, "q", function () os.execute("xscreensaver-command --lock") end),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),
   --  audio setup
      awful.key({ }, "XF86AudioRaiseVolume", function ()
         awful.util.spawn("amixer set Master 5%+", false) end),
      awful.key({ }, "XF86AudioLowerVolume", function ()
          awful.util.spawn("amixer set Master 5%-", false) end),
      awful.key({ }, "XF86AudioMute", function ()
          awful.util.spawn("amixer set Master toggle", false) end),
    
        
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
    awful.key({ modkey,           }, "d",
       function()
           if beautiful.lower_window_height == 0 then
               beautiful.lower_window_height = beautiful.original_lowerer_window_height
           end
           beautiful.lower_window_height = beautiful.lower_window_height + 11
           --awful.layout.set(daze.layout.tile)                     end),
           awful.layout.arrange(1) end),
    awful.key({ modkey, "Shift"   }, "d",
       function()
           if beautiful.lower_window_height == 0 then
               beautiful.lower_window_height = beautiful.original_lowerer_window_height
           end

           beautiful.lower_window_height = beautiful.lower_window_height - 11
           --awful.layout.set(daze.layout.tile)                     end),
           awful.layout.arrange(1) end),
   awful.key({ modkey,            }, "e",
        function()
            if beautiful.lower_window_height == beautiful.original_lowerer_window_height then
                beautiful.lower_window_height = 0
                --awful.layout.set(daze.layout.tile)
                awful.layout.arrange(1)
            else
                beautiful.lower_window_height = beautiful.original_lowerer_window_height
                --awful.layout.set(daze.layout.tile)
                awful.layout.arrange(1)
            end
        end),
    awful.key({ modkey, "Shift"  }, "e",
        function()
            beautiful.lower_window_height = beautiful.original_lowerer_window_height
            --awful.layout.set(daze.layout.tile)                            
            awful.layout.arrange(1)
        end),
           
    awful.key({ modkey,           }, "s",
        function()
            beautiful.useless_gap_width = beautiful.useless_gap_width + 11
            beautiful.outer_padding = beautiful.outer_padding + 11
--           awful.layout.set(daze.layout.tile)                    end),
            awful.layout.arrange(1) end),
    awful.key({ modkey, "Shift"          }, "s",
        function()
            beautiful.useless_gap_width = beautiful.useless_gap_width - 11
            beautiful.outer_padding = beautiful.outer_padding - 11
            --awful.layout.set(daze.layout.tile)                   end),
            awful.layout.arrange(1) end),
            
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
    
    awful.key({ modkey, "Shift"   }, "f",  awful.client.floating.toggle ),
    awful.key({ modkey, "Control" }, "n", awful.client.restore),
    --this sets daze - if it's not in a function then it will set on tag 0.

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()

                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     size_hints_honor = false,
		     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { instance = "plugin-container" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}
-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--if totalScreens == 1 then
--    awful.util.spawn_with_shell("xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output DVI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate normal")
--end

awful.util.spawn_with_shell("nitrogen --restore")
naughty.notify({
                 title = "You have updates!",
                 text = getUpdates(),
                 timeout = 10
             })



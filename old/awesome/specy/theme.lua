-------------------------
-- specy awesome theme --
-------------------------

theme = {}

theme.useless_gap_width = "20"
--setting to zero makes all the slave windows the same height
theme.original_lowerer_window_height = "94"
theme.lower_window_height = "94"
theme.vertical_resolution = "1080"
theme.vertical_border = "8"
theme.outer_padding = "18"

theme.font          = "cure 8"
--background colors
theme.bg_normal     = "#1c1c1c"
theme.bg_focus      = "#2b2d2e"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#a0a0a0"
theme.bg_systray    = theme.bg_normal
--foreground colors
theme.fg_focus      = "#e7fbfb"
theme.fg_normal     = "#a0a0a0"
theme.fg_urgent     = "#eae7f9"
theme.fg_minimize   = "#eae7f9"

theme.border_width  = 2
theme.border_normal = "#242125"
theme.border_focus  = "#a0a0a0"
theme.border_marked = "#91231c"

theme.tasklist_disable_icon = true
theme.menu_height = 15
theme.menu_width  = 100
theme.icon_theme = nil

return theme

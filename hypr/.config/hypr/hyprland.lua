-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("LIBVA_DRIVER_NAME",            "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME",    "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("NVD_BACKEND",                  "direct")
-- hl.env("ENABLE_HDR_WSI",               "1")

hl.env("XCURSOR_SIZE",    "24")
hl.env("HYPRCURSOR_SIZE", "24")


------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "HDMI-A-2",
    mode     = "3440x1440@174.96Hz",
    position = "0x0",
    scale    = 1,

    vrr = 3,

    cm                  = "hdredid",
    bitdepth            = 10,
    supports_hdr        = true,
    supports_wide_color = true,

    sdr_min_luminance = 0.0,
    sdr_max_luminance = 450,
    sdrsaturation     = 1.0,
    max_luminance     = 1000,
    sdr_eotf          = "gamma22",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = "fuzzel"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("swaync")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("playerctld daemon")

    -- Start on workspace 1
    -- hl.exec_cmd("hyprctl dispatch workspace 1")
end)


-----------------------
----- PERMISSIONS -----
-----------------------

-- Permission changes require a full Hyprland restart.

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission(
--     "/usr/(bin|local/bin)/grim",
--     "screencopy",
--     "allow"
-- )
--
-- hl.permission(
--     "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",
--     "screencopy",
--     "allow"
-- )
--
-- hl.permission(
--     "/usr/(bin|local/bin)/hyprpm",
--     "plugin",
--     "allow"
-- )


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgba(33ccffee)",
                    "rgba(00ff99ee)",
                },
                angle = 45,
            },

            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },

    binds = {
        allow_workspace_cycles = true,
        scroll_event_delay     = 1,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

-- Optional Waybar blur:
-- hl.layer_rule({
--     name  = "blur-waybar",
--     match = { namespace = "^waybar$" },
--     blur  = true,
-- })


--------------------
---- ANIMATIONS ----
--------------------

hl.curve("easeOutQuint", {
    type   = "bezier",
    points = {
        { 0.23, 1 },
        { 0.32, 1 },
    },
})

hl.curve("easeInOutCubic", {
    type   = "bezier",
    points = {
        { 0.65, 0.05 },
        { 0.36, 1 },
    },
})

hl.curve("linear", {
    type   = "bezier",
    points = {
        { 0, 0 },
        { 1, 1 },
    },
})

hl.curve("almostLinear", {
    type   = "bezier",
    points = {
        { 0.5,  0.5 },
        { 0.75, 1 },
    },
})

hl.curve("quick", {
    type   = "bezier",
    points = {
        { 0.15, 0 },
        { 0.1,  1 },
    },
})

hl.animation({
    leaf    = "global",
    enabled = true,
    speed   = 10,
    bezier  = "default",
})

hl.animation({
    leaf    = "border",
    enabled = true,
    speed   = 5.39,
    bezier  = "easeOutQuint",
})

hl.animation({
    leaf    = "windows",
    enabled = true,
    speed   = 4.79,
    bezier  = "easeOutQuint",
})

hl.animation({
    leaf    = "windowsIn",
    enabled = true,
    speed   = 4.1,
    bezier  = "easeOutQuint",
    style   = "popin 87%",
})

hl.animation({
    leaf    = "windowsOut",
    enabled = true,
    speed   = 1.49,
    bezier  = "linear",
    style   = "popin 87%",
})

hl.animation({
    leaf    = "fadeIn",
    enabled = true,
    speed   = 1.73,
    bezier  = "almostLinear",
})

hl.animation({
    leaf    = "fadeOut",
    enabled = true,
    speed   = 1.46,
    bezier  = "almostLinear",
})

hl.animation({
    leaf    = "fade",
    enabled = true,
    speed   = 3.03,
    bezier  = "quick",
})

hl.animation({
    leaf    = "layers",
    enabled = true,
    speed   = 3.81,
    bezier  = "easeOutQuint",
})

hl.animation({
    leaf    = "layersIn",
    enabled = true,
    speed   = 4,
    bezier  = "easeOutQuint",
    style   = "fade",
})

hl.animation({
    leaf    = "layersOut",
    enabled = true,
    speed   = 1.5,
    bezier  = "linear",
    style   = "fade",
})

hl.animation({
    leaf    = "fadeLayersIn",
    enabled = true,
    speed   = 1.79,
    bezier  = "almostLinear",
})

hl.animation({
    leaf    = "fadeLayersOut",
    enabled = true,
    speed   = 1.39,
    bezier  = "almostLinear",
})

hl.animation({
    leaf    = "workspaces",
    enabled = true,
    speed   = 1.94,
    bezier  = "almostLinear",
    style   = "fade",
})

hl.animation({
    leaf    = "workspacesIn",
    enabled = true,
    speed   = 1.21,
    bezier  = "almostLinear",
    style   = "fade",
})

hl.animation({
    leaf    = "workspacesOut",
    enabled = true,
    speed   = 1.94,
    bezier  = "almostLinear",
    style   = "fade",
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "pl",
        kb_options = "caps:ctrl_modifier",

        follow_mouse = 1,
        sensitivity  = -0.7,

        repeat_rate  = 40,
        repeat_delay = 200,

        touchpad = {
            natural_scroll = false,
        },
    },
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Applications and window controls
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"))

hl.bind(
    mainMod .. " + I",
    hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 1 && swaylock")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd("hyprshot -m region")
)

hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd(terminal .. " --class clipse -e clipse")
)

hl.bind(
    mainMod .. " + F",
    hl.dsp.window.fullscreen({
        mode   = "fullscreen",
        action = "toggle",
    })
)

hl.bind(
    mainMod .. " + SHIFT + F",
    hl.dsp.window.float({
        action = "toggle",
    })
)

hl.bind(
    mainMod .. " + O",
    hl.dsp.window.pseudo({
        action = "toggle",
    })
)

hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/mute_focused.fish")
)


-------------------
---- FOCUS/MOVE ----
-------------------

hl.bind(
    mainMod .. " + H",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + L",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(
    mainMod .. " + K",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(
    mainMod .. " + J",
    hl.dsp.focus({ direction = "down" })
)

-- Focus a floating/tiled window.
-- These use the legacy dispatcher through hyprctl because there is no
-- equally direct example mapping for focuswindow selectors.
hl.bind(
    mainMod .. " + Tab",
    hl.dsp.exec_cmd("hyprctl dispatch focuswindow floating")
)

hl.bind(
    mainMod .. " + SHIFT + Tab",
    hl.dsp.exec_cmd("hyprctl dispatch focuswindow tiled")
)

hl.bind(
    mainMod .. " + SHIFT + H",
    hl.dsp.window.move({ direction = "left" })
)

hl.bind(
    mainMod .. " + SHIFT + L",
    hl.dsp.window.move({ direction = "right" })
)

hl.bind(
    mainMod .. " + SHIFT + K",
    hl.dsp.window.move({ direction = "up" })
)

hl.bind(
    mainMod .. " + SHIFT + J",
    hl.dsp.window.move({ direction = "down" })
)


--------------------
---- WORKSPACES ----
--------------------

for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end

-- Workspace-to-monitor assignments.
for i = 1, 5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor   = "DVI-D-1",
    })
end

for i = 6, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor   = "HDMI-A-1",
    })
end

-- Kept from the original configuration, although workspace 0 is not used by
-- the numeric bindings above.
hl.workspace_rule({
    workspace = "1",
    monitor   = "HDMI-A-1",
})

-- Previous focus
hl.bind(
    mainMod .. " + backslash",
    hl.dsp.focus({ last=1 })
)

-- Scratchpad
hl.bind(
    mainMod .. " + P",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + P",
    hl.dsp.window.move({ workspace = "special:magic" })
)

-- Scroll through existing workspaces
hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e-1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e+1" })
)


----------------------------
---- MOUSE MOVE/RESIZE ----
----------------------------

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


-------------------------
---- MULTIMEDIA KEYS ----
-------------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    {
        locked    = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    {
        locked    = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    {
        locked    = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    {
        locked    = true,
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    {
        locked    = true,
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    {
        locked    = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)


--------------
---- ZOOM ----
--------------

hl.bind(
    mainMod .. " + SHIFT + mouse_down",
    hl.dsp.exec_cmd([[
        hyprctl -q keyword cursor:zoom_factor \
        $(hyprctl getoption cursor:zoom_factor |
        awk '/^float.*/ {print $2 * 1.1}')
    ]])
)

hl.bind(
    mainMod .. " + SHIFT + mouse_up",
    hl.dsp.exec_cmd([[
        hyprctl -q keyword cursor:zoom_factor \
        $(hyprctl getoption cursor:zoom_factor |
        awk '/^float.*/ {print $2 * 0.9}')
    ]])
)

hl.bind(
    mainMod .. " + SHIFT + equal",
    hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor 1")
)


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    -- Ignore maximize requests except for Steam applications.
    name = "suppress-maximize-events",

    match = {
        class = "^(?!steam_app_).*",
    },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland.
    name = "fix-xwayland-drags",

    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name = "pip",

    match = {
        title = "^(Picture-in-Picture)$",
    },

    float             = true,
    pin               = true,
    keep_aspect_ratio = true,
})

hl.window_rule({
    name = "speedcrunch-float",

    match = {
        title = "^(SpeedCrunch)$",
    },

    float = true,
})

hl.window_rule({
    name = "utility-terminal-float",

    match = {
        class = "^(clipse|ncpamixer|wiremix|bluetui)$",
    },

    float = true,
})

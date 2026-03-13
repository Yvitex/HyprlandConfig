# Personal Hyprland Configuration

A personal Hyprland dotfiles repository — backed up here in case my computer explodes.

Current theme: **Maid's Devotion** — a dark rose and gold aesthetic.

---

## Screenshots

### Waybar Panel
<img width="1601" height="901" alt="image" src="https://github.com/user-attachments/assets/405ef706-0eec-46a0-b37f-22358786519f" />

### Randomized Clock Widget
<img width="545" height="90" alt="image" src="https://github.com/user-attachments/assets/4f0e9dd7-259d-45ee-b5e4-509d2a91b463" />

### Workspace Active Indicator
<img width="183" height="68" alt="image" src="https://github.com/user-attachments/assets/c8ffa2c5-c354-4237-86c1-e336fc1b8d49" />

### Media Player (MPRIS)
<img width="461" height="61" alt="image" src="https://github.com/user-attachments/assets/2dad1242-2c30-4956-a432-42f40b0b14b5" />

---

## Stack

| Role | Tool |
|---|---|
| Compositor | [Hyprland](https://hyprland.org/) |
| Terminal | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| File Manager | [Nautilus](https://apps.gnome.org/Nautilus/) |
| App Launcher | [Rofi](https://github.com/davatorium/rofi) |
| Status Bar | [Waybar](https://github.com/Alexays/Waybar) |
| Sidebar Shell | [Quickshell](https://quickshell.outfoxxed.me/) |
| Wallpaper | [Hyprpaper](https://github.com/hyprwm/hyprpaper) |
| Notifications | [Dunst](https://dunst-project.org/) |
| Screenshots | [Hyprshot](https://github.com/micha-sky/hyprshot) |
| Media Control | [Playerctl](https://github.com/altdesktop/playerctl) |
| Audio | wpctl / pactl (PipeWire) |
| Brightness | [Brightnessctl](https://github.com/Hummer12007/brightnessctl) |
| Font | [DepartureMono Nerd Font](https://www.nerdfonts.com/) |

---

## Dependencies

Install these before applying the config:

```bash
# Arch Linux / yay
yay -S hyprland hyprpaper waybar dunst kitty nautilus rofi quickshell \
        hyprshot playerctl brightnessctl pipewire wireplumber \
        departure-mono-nerd
```

---

## File Structure

```
~/.config/
├── hypr/
│   ├── hyprland.conf       # Main Hyprland configuration
│   └── hyprpaper.conf      # Wallpaper configuration
├── waybar/
│   ├── config.jsonc        # Main bar module layout
│   ├── style.css           # Main bar styling
│   ├── sidebar.jsonc       # Sidebar bar module layout
│   ├── sidebar.css         # Sidebar bar styling
│   ├── launch.sh           # Waybar restart script
│   ├── timeicon.sh         # Custom clock widget script
│   └── maid_quote.sh       # Rotating maid servant quotes
├── quickshell/
│   ├── shell.qml           # Shell root — toggle tab + sidebar loader
│   └── Sidebar.qml         # Sidebar panel (calendar, media, quotes)
├── kitty/
│   └── kitty.conf          # Terminal with Maid's Devotion color scheme
├── dunst/
│   └── dunstrc             # Notification styling
├── rofi/
│   └── config.rasi         # App launcher styling
└── wallpaper/
    └── wallhaven-o5w1gl.png
```

---

## Theme: Maid's Devotion

### Color Palette

| Name | Hex | Role |
|---|---|---|
| Uniform Black | `#0D0B0F` | Background |
| Rose Ribbon | `#C8638A` | Primary accent |
| Gold Trim | `#D4AF37` | Elite accent |
| Deep Plum | `#2A1E2E` | Inactive borders |
| Silk White | `#F0E8F0` | Foreground text |

This palette is applied consistently across Hyprland borders, Waybar, Kitty, Dunst, and Quickshell.

---

## Hyprland Configuration

### Monitor

```ini
monitor=,1600x900,auto,1
```

Auto-detected monitor at 1600×900 resolution, scale 1.

### Look & Feel

| Setting | Value |
|---|---|
| Layout | Dwindle |
| Inner gaps | 5px |
| Outer gaps | 20px |
| Border size | 2px |
| Active border | Rose → Gold gradient (`#C8638A` → `#D4AF37`, 45°) |
| Inactive border | Deep Plum (`#2A1E2E`) |
| Corner rounding | 14px |
| Window shadow | Enabled |
| Background blur | Enabled |
| Transparency | Fully opaque (active & inactive) |

### Animations

Uses "silk" bezier curves for smooth, fluid transitions:

| Curve | Description |
|---|---|
| `silk` | Smooth deceleration — global default |
| `silkIn` | Ease-in for entering elements |
| `silkOut` | Ease-out for exiting elements |
| `bounce` | Overshoot spring for windows opening |
| `quick` | Fast snap |

Windows pop in at 80% scale (`popin 80%`) with a bounce on open; silkOut on close.

### Input

- **Keyboard layout**: US
- **Mouse follow focus**: Enabled
- **Touchpad natural scroll**: Disabled
- **3-finger horizontal gesture**: Switch workspaces

---

## Keybindings

`$mainMod` = `SUPER` (Windows key)

### Applications

| Keybind | Action |
|---|---|
| `SUPER + Return` | Open terminal (Kitty) |
| `SUPER + E` | Open file manager (Nautilus) |
| `SUPER + O` | Open app launcher (Rofi) |
| `SUPER + A` | Open Firefox |

### Window Management

| Keybind | Action |
|---|---|
| `SUPER + Q` | Close active window |
| `SUPER + M` | Exit Hyprland |
| `SUPER + V` | Toggle floating mode |
| `SUPER + P` | Toggle pseudotile (dwindle) |
| `SUPER + J` | Toggle split direction (dwindle) |

### Focus & Navigation

| Keybind | Action |
|---|---|
| `SUPER + Arrow Keys` | Move focus (left/right/up/down) |
| `SUPER + 1–9, 0` | Switch to workspace 1–10 |
| `SUPER + SHIFT + 1–9, 0` | Move active window to workspace 1–10 |
| `SUPER + Mouse Scroll Up` | Next workspace |
| `SUPER + Mouse Scroll Down` | Previous workspace |

### Scratchpad

| Keybind | Action |
|---|---|
| `SUPER + S` | Toggle scratchpad (`magic`) |
| `SUPER + SHIFT + S` | Send active window to scratchpad |

### Mouse

| Keybind | Action |
|---|---|
| `SUPER + LMB drag` | Move window |
| `SUPER + RMB drag` | Resize window |

### Screenshots

| Keybind | Action |
|---|---|
| `SUPER + SHIFT + C` | Region screenshot to clipboard (Hyprshot) |

### Media & System Keys

| Key | Action |
|---|---|
| `XF86AudioRaiseVolume` | Volume +5% |
| `XF86AudioLowerVolume` | Volume -5% |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioMicMute` | Toggle mic mute |
| `XF86MonBrightnessUp` | Brightness +5% |
| `XF86MonBrightnessDown` | Brightness -5% |
| `XF86AudioPlay / Pause` | Play/pause media |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |

### Utility

| Keybind | Action |
|---|---|
| `SUPER + SHIFT + B` | Restart Waybar |

---

## Waybar

### Layout

```
[ Workspaces | MPRIS ]     [ Clock Widget | Maid Quote ]     [ Vol | Mic | CPU | RAM | Temp ]
```

- **Left**: Hyprland workspace buttons + media player (MPRIS)
- **Center**: Custom time/greeting widget + rotating maid quote
- **Right**: Speaker volume, microphone, CPU usage, RAM usage, CPU temperature

### Custom Clock Widget (`timeicon.sh`)

The center clock widget has a **30% chance** of displaying a random funny message instead of the normal greeting. The normal greeting adapts to time of day:

| Time | Greeting |
|---|---|
| 00:00 – 04:59 | Good night |
| 05:00 – 11:59 | Good morning |
| 12:00 – 17:59 | Good afternoon |
| 18:00 – 23:59 | Good evening |

Clicking the widget sends a desktop notification showing the full current date.

### Maid Quote Widget (`maid_quote.sh`)

Displays a randomly selected servant phrase from a pool of 21 quotes (e.g. *"Your humble servant stands ready."*, *"Leave the rest to me, Master."*). A different quote is shown on each Waybar refresh.

### Styling

- **Font**: DepartureMono Nerd Font, 13px
- **Background**: Transparent (`rgba(0,0,0,0)`)
- **Modules**: Semi-transparent dark background with rose border and rounded corners
- **Active workspace**: Rose (`#C8638A`) background
- **Workspace hover**: Gold (`#D4AF37`) highlight

---

## Quickshell Sidebar

A collapsible right-edge sidebar built with Quickshell (QML).

### Toggle Tab

A small rose-colored pill (`#C8638A`) sits on the right screen edge at all times. It gently pulses when the sidebar is closed. Click it to open or close the sidebar.

### Sidebar Panels

| Panel | Description |
|---|---|
| **Calendar** | Full monthly calendar with prev/next navigation; today highlighted in gold |
| **Media Player** | MPRIS album art, track title, artist, play/pause and skip controls |
| **Maid Quote** | A randomly selected devotion quote, refreshed on open |

---

## Kitty Terminal

The terminal uses a full "Maid's Devotion" color scheme:

- **Background**: `#0D0B0F` at 88% opacity
- **Cursor**: Rose (`#C8638A`) with dark text
- **Selection**: Rose highlight
- **URL underline**: Gold (`#D4AF37`)
- **Active tab**: Rose background
- **Active border**: Rose; bell border Gold

---

## Dunst Notifications

Notifications are themed to match:

- **Font**: DepartureMono Nerd Font 11
- **Background**: `#0D0B0F`
- **Low urgency frame**: Deep Plum (`#2A1E2E`)
- **Normal urgency frame**: Rose (`#C8638A`)
- **Critical urgency frame**: Gold (`#D4AF37`)

---

## Wallpaper

Managed by `hyprpaper`. The wallpaper is set to fill the screen with `fit_mode = cover` and IPC is enabled for on-the-fly changes.

```ini
preload = ~/.config/wallpaper/wallhaven-o5w1gl.png

wallpaper {
    monitor =
    path = ~/.config/wallpaper/wallhaven-o5w1gl.png
    fit_mode = cover
}
```

---

## Autostart

The following are launched automatically on Hyprland start:

| Program | Purpose |
|---|---|
| `hyprpaper` | Wallpaper daemon |
| `~/.config/waybar/launch.sh` | Status bar |
| `quickshell` | Sidebar shell |
| `dunst` | Notification daemon |

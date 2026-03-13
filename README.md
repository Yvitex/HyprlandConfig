# Personal Hyprland Configuration

A personal Hyprland dotfiles repository — backed up here in case my computer explodes.

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
yay -S hyprland hyprpaper waybar dunst kitty nautilus rofi \
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
│   ├── config.jsonc        # Waybar module layout
│   ├── style.css           # Waybar styling
│   ├── launch.sh           # Waybar restart script
│   └── timeicon.sh         # Custom clock widget script
└── wallpaper/
    └── wallhaven-o5w1gl.png
```

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
| Active border | White → Green gradient (45°) |
| Inactive border | `#6B8BCF` (blue) |
| Corner rounding | 10px |
| Window shadow | Enabled (range 15) |
| Background blur | Enabled (size 3, 1 pass) |
| Transparency | Fully opaque (active & inactive) |

### Animations

Uses custom bezier curves for smooth transitions:

| Curve | Description |
|---|---|
| `easeOutQuint` | Snappy deceleration for windows and borders |
| `easeInOutCubic` | Smooth in-and-out |
| `almostLinear` | Near-linear for fades and workspace transitions |
| `quick` | Fast snap for fade and zoom |

Windows pop in at 87% scale (`popin 87%`) on open and close.

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
[ Workspaces | MPRIS ]     [ Clock Widget ]     [ Vol | Mic | CPU | RAM | Temp ]
```

- **Left**: Hyprland workspace buttons + media player (MPRIS)
- **Center**: Custom time/greeting widget
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

### Styling

- **Font**: DepartureMono Nerd Font, 13px
- **Background**: Transparent (`rgba(0,0,0,0)`)
- **Modules**: Semi-transparent black background (`rgba(0,0,0,0.7)`) with white `1px` border and `8px` rounded corners
- **Active workspace**: White background, black text
- **Workspace hover**: Red highlight

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
| `dunst` | Notification daemon |

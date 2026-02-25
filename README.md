bin
===
A collection of short utility scripts.

Usage
-----
```bash
export PATH=$HOME/bin/local:$HOME/bin:$PATH
```

Scripts
-------

| Script                 | Description                                                       |
| ---------------------- | ----------------------------------------------------------------- |
| `arp-ip`               | Resolve a MAC address to an IP address via ARP                    |
| `asound-id`            | Get ALSA sound card ID by name                                    |
| `audio-title`          | Display currently playing audio title from various sources        |
| `backlight`            | Adjust display backlight brightness                               |
| `base64-img`           | Encode an image file as a base64 data URI                         |
| `battery`              | Show battery status for UPower, Razer and headset devices         |
| `bench`                | Benchmark a command by running it N times                         |
| `bios`                 | Print BIOS version from DMI                                       |
| `btrfs-du`             | Show disk usage for a btrfs snapshot                              |
| `castd`                | Chromecast control daemon                                         |
| `castd-cmd`            | Send a command to the castd daemon                                |
| `cate`                 | Cat a file with escape sequence interpretation                    |
| `cava-frame`           | Render a cava audio visualizer frame as Unicode block characters  |
| `cavad`                | Daemon to manage cava, restarting on audio sink changes           |
| `ccd-temp`             | Show average AMD CCD temperature                                  |
| `cert`                 | Fetch a TLS certificate from a remote host                        |
| `certparse`            | Parse and display an X.509 certificate from stdin                 |
| `cidr`                 | List all IP addresses in a CIDR range                             |
| `clip`                 | Copy stdin or a file to the clipboard                             |
| `cmd-exists`           | Check if a command exists                                         |
| `colors`               | Display terminal ANSI color palette                               |
| `compiz-plugin`        | List, enable or disable Compiz plugins                            |
| `cpu`                  | Print CPU model and thread count                                  |
| `cpu-governor`         | Show the current CPU frequency scaling governor                   |
| `cpu-status`           | Show CPU utilization and temperature                              |
| `cpu-temp`             | Show AMD k10temp Tctl temperature                                 |
| `cpu-util`             | Show CPU utilization percentage                                   |
| `csr`                  | Generate an OpenSSL certificate signing request                   |
| `deleted`              | List running processes whose binaries have been deleted           |
| `discord`              | Launch Discord via tray wrapper                                   |
| `discord-tray`         | Run Discord with a GTK system tray icon                           |
| `disk`                 | List non-removable disk models                                    |
| `display-mode`         | Set display color temperature and brightness for day/night        |
| `dns`                  | Resolve a domain name to IP addresses                             |
| `dnxhr`                | Transcode a video file to DNxHR HQ format                         |
| `doh-check`            | Check if DNS-over-HTTPS is active                                 |
| `echopass`             | Prompt for a password and echo it to stdout                       |
| `ediff`                | Open two files in Emacs ediff                                     |
| `edit`                 | Open a file in the preferred editor                               |
| `eman`                 | View man pages in Emacs                                           |
| `enc`                  | Re-encode a video file with a specified audio codec               |
| `epoch`                | Convert epoch timestamp to date, or print current epoch           |
| `esc`                  | Shell-escape each line of input                                   |
| `eslint-dir`           | Run ESLint on all JS files in a directory                         |
| `evalias`              | Execute a command with shell aliases expanded                     |
| `fangd`                | Fan speed control daemon driven by temperature curves             |
| `fetch`                | Display system information summary (CPU, RAM, GPU, etc.)          |
| `font-touch`           | Force GTK font reload by toggling the font setting                |
| `foreign-pkgs`         | List installed foreign packages not in the AUR                    |
| `forp`                 | Run a command in parallel over line-delimited arguments           |
| `fx-remove-favicons`   | Remove favicons for specified domains from the Firefox database   |
| `gecos`                | Print GECOS field for a user from /etc/passwd                     |
| `gif`                  | Convert a video file to an animated GIF                           |
| `git-sign-all`         | GPG re-sign all commits in a Git repository                       |
| `github`               | Open GitHub pages for the current repository in a browser         |
| `gpass`                | Run pass with GTK pinentry                                        |
| `gpg`                  | GPG wrapper that sets GNUPGHOME for the configured key            |
| `gpu`                  | Print GPU model from lspci                                        |
| `gpu-glx`              | Print the OpenGL renderer string                                  |
| `gtk-inspect`          | Launch an application with the GTK inspector enabled              |
| `headset-battery`      | Show wireless headset battery level                               |
| `hex`                  | Hex dump the first N bytes of a file                              |
| `hostname-pretty`      | Print the pretty hostname                                         |
| `hwmon`                | Query hwmon sensors by device and sensor name                     |
| `ibm-fan`              | Show ThinkPad fan speed                                           |
| `if-ip`                | Show the IP address of a network interface                        |
| `ifspeed`              | Show link speed for all network interfaces                        |
| `imgur`                | Upload an image to Imgur                                          |
| `immutables`           | Find files with the immutable attribute set                       |
| `kat`                  | Cat a file, suppressing errors                                    |
| `keep`                 | Restart a program if it exits, with crash detection               |
| `kernel`               | Show the latest upstream Linux kernel version                     |
| `krbcc`                | Print the Kerberos credential cache path for a user               |
| `ktinit`               | Initialize a Kerberos keytab for a user                           |
| `limit`                | Run a program with a network bandwidth limit                      |
| `local-cert`           | Generate a local CA and signed TLS certificate                    |
| `lock-1password`       | Lock 1Password                                                    |
| `lock-all`             | Lock all credential stores (1Password, GPG, keyring, SSH)         |
| `lock-gpg`             | Reload the GPG agent to clear cached passphrases                  |
| `lock-keyring`         | Lock the GNOME keyring                                            |
| `lock-ssh-agent`       | Remove all keys from the SSH agent                                |
| `lock-ssh-sockets`     | Remove SSH control master sockets                                 |
| `lockdown`             | Lock all credential stores and lock the screen                    |
| `makepkg`              | Wrapper for makepkg with dedicated GPG keyring and nice priority  |
| `makepkg-key`          | Manage the makepkg GPG keyring                                    |
| `makepkgs`             | Build multiple packages in parallel                               |
| `march-native`         | Print the GCC -march=native architecture string                   |
| `mdstatus`             | Show software RAID sync status                                    |
| `mem`                  | Print total system memory                                         |
| `mem-dmi`              | Print memory details from DMI/SMBIOS                              |
| `mem-dt`               | Print total memory from device tree                               |
| `mime`                 | Print the MIME type of a file                                     |
| `mindiff`              | Diff two files with token-level granularity                       |
| `model`                | Print the system model/product name                               |
| `modparam`             | Show parameters for a loaded kernel module                        |
| `modtaint`             | List tainted kernel modules                                       |
| `motd`                 | Display message of the day with system info                       |
| `murder`               | Kill all processes owned by a user                                |
| `next-window`          | Focus the next window matching the active window class            |
| `nicely`               | Run a command with low CPU and I/O priority                       |
| `node`                 | Node.js wrapper with custom REPL and flags                        |
| `node-debug`           | Run Node.js with the debugger attached                            |
| `notes`                | Open the notes file in the preferred editor                       |
| `notify-sound`         | Play a notification sound                                         |
| `npu`                  | Print NPU model from lspci                                        |
| `nv-status`            | Show NVIDIA GPU utilization and temperature                       |
| `nv-temp`              | Show NVIDIA GPU temperature                                       |
| `nv-util`              | Show NVIDIA GPU utilization percentage                            |
| `nvme-temp`            | Show NVMe drive temperature                                       |
| `one`                  | Run a program only if it is not already running                   |
| `open`                 | Open files or URLs with xdg-open                                  |
| `os-update`            | Run system update functions defined in ~/.os-update               |
| `pacman-dev-upgrade`   | Upgrade VCS (git/hg/svn/bzr) packages                             |
| `pacman-lastsync`      | Show the last pacman mirror sync time                             |
| `pacman-mirror`        | Print the first configured pacman mirror URL                      |
| `pause`                | Run a command, then wait for a keypress                           |
| `pdf`                  | Merge multiple PDFs into one                                      |
| `pick-color`           | Open a color picker dialog                                        |
| `pidage`               | Show the age of a process                                         |
| `pidenv`               | Show environment variables for a process                          |
| `pinentry-user`        | Pinentry wrapper that selects backend by PINENTRY_USER_DATA       |
| `pip-update`           | Upgrade all outdated pip user packages                            |
| `pkgsource`            | Fetch Arch Linux package sources from repos or AUR                |
| `pkgver`               | Print the installed version of a package                          |
| `pkgw`                 | Show package info for a command or file                           |
| `plex-music-title`     | Print currently playing Plex music artist and title               |
| `pnpm`                 | pnpm wrapper with convenience subcommands                         |
| `prompt-color`         | Output an ANSI color code for the shell prompt                    |
| `pylon.py`             | X11 window management utility library                             |
| `qrdecode`             | Decode a QR code from an image file                               |
| `qrreencode`           | Decode and re-encode a QR code image                              |
| `qrscan`               | Capture a screen region and decode a QR code from it              |
| `razer`                | Query Razer device properties via OpenRazer                       |
| `razer-battery`        | Show Razer device battery levels                                  |
| `rdp`                  | Connect to an RDP host using a saved profile                      |
| `rgb`                  | Convert a hex color to RGB decimal values                         |
| `rhythmbox`            | Launch Rhythmbox with dconf settings preloaded                    |
| `rhythmbox-seek`       | Seek forward or backward in Rhythmbox                             |
| `rhythmbox-title`      | Print currently playing Rhythmbox artist and title                |
| `rofi-run`             | Launch rofi application launcher                                  |
| `runas`                | Run a command as another user via machinectl                      |
| `samefile`             | Find all hard links to a file                                     |
| `scan`                 | Scan a document from a flatbed scanner                            |
| `screen`               | GNU Screen wrapper with named session support                     |
| `scup`                 | Restart active services with pending markers in /run/scup         |
| `shot`                 | Take a screenshot and copy it to the clipboard                    |
| `signal`               | Launch Signal Desktop with tray icon                              |
| `spdx`                 | List known SPDX license identifiers                               |
| `sscert`               | Generate a self-signed SSL certificate                            |
| `ssh-aliases`          | List SSH host aliases from config                                 |
| `ssh-config`           | Show resolved SSH config options for a host                       |
| `ssh-forget-host`      | Remove a host from SSH known_hosts                                |
| `ssh-host`             | Resolve an SSH alias to its hostname                              |
| `ssh-host-fingerprint` | Show SSH host key fingerprints                                    |
| `ssh-mount`            | Mount a remote filesystem over SSHFS                              |
| `ssh-umount`           | Unmount an SSHFS mount                                            |
| `startx`               | Start X11 with a clean session                                    |
| `steam`                | Launch Steam with MangoHud and NVIDIA Proton settings             |
| `stock`                | Look up a stock quote by ticker symbol                            |
| `surveil`              | Watch files and re-run a command on changes                       |
| `systemctl`            | systemctl wrapper that auto-elevates with sudo                    |
| `tap`                  | Watch a script file and re-run it on changes                      |
| `tarball`              | Create or extract a zstd-compressed tarball                       |
| `teams-busylight`      | Drive a busylight based on Microsoft Teams status                 |
| `teams-status`         | Print the current Microsoft Teams status                          |
| `teams-tray`           | Microsoft Teams system tray icon with notification support        |
| `term-color`           | Set the terminal background color                                 |
| `termwin`              | Open a new terminal window                                        |
| `thunar`               | Launch Thunar with a clean config                                 |
| `timer`                | Countdown timer with system tray icon and notification            |
| `toggle`               | Toggle a program on or off by PID                                 |
| `try`                  | Retry a command until it succeeds                                 |
| `ucode`                | Print the CPU microcode revision                                  |
| `uneject`              | Close ejected optical/disk trays                                  |
| `update-check`         | Check for available Arch Linux package updates                    |
| `upower-battery`       | Show battery levels from UPower                                   |
| `uptimes`              | Print system uptime in human-readable format                      |
| `users-enabled`        | List user accounts with active passwords                          |
| `userscriptd`          | HTTP bridge daemon for browser userscript integrations            |
| `utc`                  | Print a date in UTC                                               |
| `vid`                  | Extract a clip from a video file                                  |
| `viewport`             | Manage X11 virtual desktop viewports                              |
| `volume`               | Adjust PulseAudio playback volume                                 |
| `vulns`                | Show CPU vulnerability mitigations                                |
| `win-ver`              | Print the Windows version (from WSL)                              |
| `wsl-cmd`              | Open a Windows cmd.exe shell from WSL                             |
| `wsl-env-var`          | Read a Windows environment variable from WSL                      |
| `wsl-exec`             | Execute a Windows binary from WSL with line ending cleanup        |
| `wsl-interop`          | Restore WSL interop for Windows binary execution                  |
| `wsl-is-rdp`           | Check if the WSL session is over RDP                              |
| `wsl-lock`             | Lock the Windows workstation from WSL                             |
| `wsl-ver`              | Print the WSL version                                             |
| `wx`                   | Show current weather conditions                                   |
| `x86-64-level`         | Print the x86-64 microarchitecture level (v1–v4)                  |
| `xbindkeys`            | Launch xbindkeys with optional local config                       |
| `xdg-dirs`             | List all XDG directory environment variables                      |
| `xdg-open`             | xdg-open wrapper with custom URI scheme handling                  |
| `youtube-get-title`    | Get and cache a YouTube video title                               |
| `yt-music-title`       | Print currently playing YouTube Music artist and title            |
| `yubico-tray`          | Yubico Authenticator system tray icon                             |

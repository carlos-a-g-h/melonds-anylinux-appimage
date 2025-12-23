# melonDS Anylinux AppImages 🐧

## Build status

[![GitHub Downloads](https://img.shields.io/github/downloads/carlos-a-g-h/melonds-anylinux-appimage/total?logo=github&label=GitHub%20Downloads)](https://github.com/carlos-a-g-h/melonds-anylinux-appimage/releases/latest)

[![CI Build Status](https://github.com//carlos-a-g-h/melonds-anylinux-appimage/actions/workflows/appimage.yml/badge.svg)](https://github.com/carlos-a-g-h/melonds-anylinux-appimage/releases/latest)

* [Latest Stable Release](https://github.com/carlos-a-g-h/melonds-anylinux-appimage/releases/latest)

## About this AppImage

### These AppImages VS the official ones

The melonDS project build their own AppImages [and push them to their releases](https://github.com/melonDS-emu/melonDS/releases), however, these AppImages do not run on older systems, and that is why I made this repository, more details about this at the end of the README

<details>
  <summary><b><i>The official AppImage does not run on an older system</i></b></summary>
    <img width="1920" height="1080" alt="melonds-official-does-not-run" src="https://github.com/user-attachments/assets/62451cdb-1512-449f-aeb0-1b8342c34056" />
  </a>
</details>

<details>
  <summary><b><i>The AnyLinux AppImage can run anywhere</i></b></summary>
    <img width="1920" height="1080" alt="melonds-anylinux-runs" src="https://github.com/user-attachments/assets/bbb31370-cf34-459d-b6b8-35dc98e426f0" />
  </a>
</details>

### Sources used

The main binary used for making these unofficial AppImages are downloaded from the official builds available on melonDS's [website](https://melonds.kuribo64.net/downloads.php)

### Internal scripts and programs

These AppImages have internal scripts and programs, that can be launched by calling them as commandline arguments

```
./melonDS.AppImage [program]
```

This AppImage has internal scripts and programs that can be launched by calling them as commandline arguments

|Program or script|Description|
|-|-|
|vbam|Run SDL port instead of the wxGTK port|
| setup | An "installation" script for the appimage. It provides a nice config, a DESKTOP file in /usr/share/applications and an icon |
| details | Extracts the "details" directory from the AppImage |

### About the setup script

This script can help you integrate the appimage to your system

```
./melonDS.AppImage setup [FLAGS]
```

| Flag | Description |
|-|-|
| --install | Performs the installation, integrating the appimage to your system |
| --no-config | Will not copy the recommended config to your system |
| --no-links | Will not create symlinks that go from /usr/bin/ to the AppImage |
| --no-desktop | Will not create the application desktop file and its icon |
| --force | Overwrites in case that there are files or paths that already exist |

Use the command without any arguments for more details

## What is AnyLinux ?

These AppImages are made using [sharun](https://github.com/VHSgunzo/sharun), which makes it extremely easy to turn any binary into a portable package without using containers or similar tricks.

**These AppImages bundle everything and should work on any linux distro, even on musl based ones.**

These AppImages can work **without FUSE** at all thanks to the [uruntime](https://github.com/VHSgunzo/uruntime)

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)

<details>
  <summary><b><i>raison d'être</i></b></summary>
    <img src="https://github.com/user-attachments/assets/d40067a6-37d2-4784-927c-2c7f7cc6104b" alt="Inspiration Image">
  </a>
</details>

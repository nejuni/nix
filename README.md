# Termux Backup

Script for backing up my termux configuration

## Installation from scratch

```sh
git clone https://github.com/nejuni/nix.git && cd nix && bash install.sh
```

## Home dir setup

```sh
git clone https://github.com/nejuni/nix.git && cd nix && bash install.sh usr
```
# Termux Package Documentation

This README provides an overview of various packages available in the [Termux](https://termux.com/) environment, a Linux terminal emulator for Android. Each package name is linked to its official project page, documentation, or a relevant resource, with a brief description of its purpose and functionality. The packages are grouped by their primary functionality for easier navigation.

## Table of Contents
- [Core System Utilities](#core-system-utilities)
- [File and Package Management](#file-and-package-management)
- [Text Processing and Editing](#text-processing-and-editing)
- [File System Navigation and Analysis](#file-system-navigation-and-analysis)
- [Networking and Download Tools](#networking-and-download-tools)
- [Security and Encryption](#security-and-encryption)
- [System Monitoring and Process Management](#system-monitoring-and-process-management)
- [Development and Version Control](#development-and-version-control)
- [Terminal Enhancements](#terminal-enhancements)
- [Multimedia and Data Processing](#multimedia-and-data-processing)
- [Compression and Cryptographic Libraries](#compression-and-cryptographic-libraries)
- [System Libraries](#system-libraries)
- [Miscellaneous Tools](#miscellaneous-tools)

## Core System Utilities

- [**bash**](https://www.gnu.org/software/bash/): A powerful Unix shell for scripting and interactive command-line use, supporting variables, loops, and functions.
- [**dash**](https://git.kernel.org/pub/scm/utils/dash/dash.git): A lightweight, POSIX-compliant shell optimized for fast script execution with minimal features.
- [**coreutils**](https://www.gnu.org/software/coreutils/): Essential Unix tools like `ls`, `cp`, `mv`, `rm`, `cat`, for file, text, and system management.
- [**debianutils**](https://packages.debian.org/sid/debianutils): Miscellaneous utilities like `which` (locates executables) and `tempfile` (creates temporary files).
- [**termux-core**](https://github.com/termux/termux-packages): Core Termux components enabling basic functionality like environment setup and command execution.
- [**termux-tools**](https://github.com/termux/termux-packages): Termux-specific utilities like `termux-toast` (shows Android notifications) and `termux-open` (opens files).
- [**termux-exec**](https://github.com/termux/termux-exec): Ensures scripts and binaries run correctly in Termux by handling shebangs properly.
- [**termux-am**](https://github.com/termux/termux-packages): Provides the `am` command to interact with Android system components like activities and services.
- [**termux-am-socket**](https://github.com/termux/termux-packages): Enables socket-based communication for Android Management in Termux.
- [**termux-api**](https://termux.dev/en/docs/termux-api): Allows Termux to access Android features like camera, GPS, or notifications via CLI commands.
- [**termux-keyring**](https://github.com/termux/termux-packages): Manages GPG keys for verifying Termux package signatures.
- [**termux-licenses**](https://github.com/termux/termux-packages): Contains license information for Termux packages and dependencies.

## File and Package Management

- [**apt**](https://wiki.debian.org/Apt): Debian package manager for installing, updating, and managing software packages in Termux.
- [**dpkg**](https://wiki.debian.org/dpkg): Low-level tool for handling `.deb` packages, used by `apt` for installation and package queries.
- [**stow**](https://www.gnu.org/software/stow/): Manages symlinks to organize user-installed software in a clean, modular way.
- [**tar**](https://www.gnu.org/software/tar/): Creates and extracts archives (e.g., `.tar.gz`, `.tar.bz2`) for backups or software distribution.
- [**unzip**](https://info-zip.org/UnZip.html): Extracts files from `.zip` archives, commonly used for compressed downloads.
- [**bzip2**](https://sourceware.org/bzip2/): Compresses and decompresses files using the bzip2 algorithm, producing `.bz2` files.
- [**gzip**](https://www.gnu.org/software/gzip/): Compresses and decompresses files using the gzip algorithm, producing `.gz` files.
- [**xz-utils**](https://tukaani.org/xz/): Handles `.xz` and `.lzma` compression formats, offering high compression ratios.
- [**zstd**](https://github.com/facebook/zstd): Provides fast compression and decompression for `.zst` files with good ratios.
- [**xxhash**](https://github.com/Cyan4973/xxHash): Generates fast, non-cryptographic checksums for verifying file integrity.
- [**zlib**](https://zlib.net/): A compression library used by many tools for handling `.gz` and other compressed formats.
- [**pip**](https://pip.pypa.io/): Python package manager for installing and managing Python libraries and dependencies.

## Text Processing and Editing

- [**nano**](https://www.nano-editor.org/): A user-friendly, lightweight text editor for quick file editing in the terminal.
- [**neovim**](https://neovim.io/): A modernized Vim fork with enhanced features, plugins, and asynchronous processing.
- [**ed**](https://www.gnu.org/software/ed/): A basic line-based text editor, included for compatibility with older scripts.
- [**sed**](https://www.gnu.org/software/sed/): A stream editor for filtering and transforming text in scripts or pipelines.
- [**gawk**](https://www.gnu.org/software/gawk/): GNU AWK for pattern matching and text processing, ideal for data extraction.
- [**grep**](https://www.gnu.org/software/grep/): Searches text for patterns using regular expressions, essential for log analysis.
- [**diffutils**](https://www.gnu.org/software/diffutils/): Tools like `diff` and `cmp` for comparing files and directories.
- [**dos2unix**](https://waterlan.home.xs4all.nl/dos2unix.html): Converts Windows-style line endings (`CRLF`) to Unix-style (`LF`).
- [**jq**](https://jqlang.github.io/jq/): Processes and manipulates JSON data, useful for API responses and configuration files.
- [**ansifilter**](https://www.andre-simon.de/doku/ansifilter/en/ansifilter.php): Removes or converts ANSI escape codes (e.g., colors) from text output.

## File System Navigation and Analysis

- [**findutils**](https://www.gnu.org/software/findutils/): Includes `find`, `xargs`, and `locate` for searching and processing files.
- [**eza**](https://github.com/eza-community/eza): A colorful, modern alternative to `ls` with enhanced file listing features.
- [**fd**](https://github.com/sharkdp/fd): A fast, user-friendly alternative to `find` for searching files by name or type.
- [**fzf**](https://github.com/junegunn/fzf): A fuzzy finder for interactively searching files, command history, or lists.
- [**yazi**](https://github.com/sxyazi/yazi): A fast terminal file manager with file previews and extensible plugins.
- [**zoxide**](https://github.com/ajeetdsouza/zoxide): A smarter `cd` command that remembers and ranks frequently visited directories.
- [**ncdu**](https://dev.yorhel.nl/ncdu): An interactive disk usage analyzer to identify large files and directories.
- [**duf**](https://github.com/muesli/duf): A modern, colorful disk usage utility with a user-friendly interface.
- [**trash-cli**](https://github.com/andreafrancia/trash-cli): A command-line tool for managing a recycle bin, allowing file recovery.

## Networking and Download Tools

- [**curl**](https://curl.se/): Transfers data over HTTP, FTP, and other protocols, ideal for downloads and API requests.
- [**wget**](https://www.gnu.org/software/wget/): Downloads files from the web, supporting recursive downloads and resuming.
- [**aria2**](https://aria2.github.io/): A lightweight, multi-protocol download utility for HTTP, FTP, and BitTorrent.
- [**inetutils**](https://www.gnu.org/software/inetutils/): Networking tools like `telnet`, `ftp`, `ping` for diagnostics and connectivity.
- [**net-tools**](https://sourceforge.net/projects/net-tools/): Legacy tools like `ifconfig`, `netstat`, and `route` for network management.
- [**netcat-openbsd**](https://man.openbsd.org/nc.1): A versatile tool for reading/writing data over TCP/UDP connections.
- [**rclone**](https://rclone.org/): Syncs files with cloud storage services like Google Drive, Dropbox, and OneDrive.
- [**rsync**](https://rsync.samba.org/): Efficiently synchronizes files and directories, often used for backups.
- [**libcurl**](https://curl.se/libcurl/): Library providing HTTP and other protocol support for applications.
- [**libnghttp2**](https://nghttp2.org/): Implements HTTP/2 for faster web communication in applications.
- [**libnghttp3**](https://github.com/ngtcp2/nghttp3): Implements HTTP/3 for next-generation web performance.
- [**libssh2**](https://www.libssh2.org/): Library for secure file transfers and remote access via SSH.
- [**libtirpc**](https://sourceforge.net/projects/libtirpc/): Library for Remote Procedure Call (RPC) functionality.
- [**libunbound**](https://www.nlnetlabs.nl/projects/unbound/): DNS resolution and validation library for networking tools.
- [**pyftpdlib**](https://github.com/giampaolo/pyftpdlib): A Python library for creating FTP servers, enabling file transfers.
- [**yt-dlp**](https://github.com/yt-dlp/yt-dlp): A tool for downloading videos and audio from YouTube and other platforms.

## Security and Encryption

- [**gnupg**](https://gnupg.org/): Implements OpenPGP for file encryption, signing, and verification.
- [**gpgv**](https://gnupg.org/): A lightweight tool for verifying GPG signatures without full GnuPG features.
- [**libassuan**](https://gnupg.org/software/libassuan/): Inter-process communication library used by GnuPG.
- [**libgcrypt**](https://gnupg.org/software/libgcrypt/): Cryptographic library for encryption and hashing in GnuPG.
- [**libgpg-error**](https://gnupg.org/software/libgpg-error/): Error-handling library for GnuPG-related tools.
- [**libnettle**](https://www.lysator.liu.se/~nisse/nettle/): Cryptographic algorithms for encryption, used by GnuPG.
- [**libgnutls**](https://www.gnutls.org/): TLS/SSL library for secure network communication.
- [**openssl**](https://www.openssl.org/): Tools and libraries for SSL/TLS encryption and certificate management.
- [**pass**](https://www.passwordstore.org/): A password manager storing credentials in GPG-encrypted files.
- [**libidn2**](https://www.gnu.org/software/libidn2/): Handles internationalized domain names for networking.
- [**libnpth**](https://gnupg.org/software/npth/): Non-preemptive thread library for GnuPG threading.

## System Monitoring and Process Management

- [**htop**](https://htop.dev/): An interactive process viewer with CPU, memory, and process monitoring.
- [**procps**](https://gitlab.com/procps-ng/procps): Tools like `ps`, `top`, `kill`, and `free` for process and system stats.
- [**psmisc**](https://gitlab.com/psmisc/psmisc): Tools like `killall`, `pstree`, and `fuser` for process management.
- [**lsof**](https://github.com/lsof-org/lsof): Lists open files and network connections associated with processes.
- [**progress**](https://github.com/Xfennec/progress): Displays progress bars for commands like `cp`, `mv`, or `tar`.
- [**pv**](https://www.ivarch.com/programs/pv.shtml): Monitors data flow through pipelines, showing progress and speed.

## Development and Version Control

- [**git**](https://git-scm.com/): A distributed version control system for tracking code changes.
- [**gh**](https://cli.github.com/): GitHub CLI for managing repositories, issues, and pull requests.
- [**lazygit**](https://github.com/jesseduffield/lazygit): A terminal-based UI for simplifying Git operations.
- [**git-delta**](https://github.com/dandavison/delta): Enhances Git diffs with syntax highlighting and better visuals.
- [**python**](https://www.python.org/): A versatile programming language for scripting, automation, and development.
- [**patch**](https://www.gnu.org/software/patch/): Applies patch files to modify source code or text files.

## Terminal Enhancements

- [**starship**](https://starship.rs/): A customizable, cross-shell prompt with Git status and context-aware features.
- [**tmux**](https://github.com/tmux/tmux): A terminal multiplexer for managing multiple sessions and split windows.
- [**bat**](https://github.com/sharkdp/bat): A `cat` alternative with syntax highlighting and Git integration.
- [**less**](https://www.greenwoodsoftware.com/less/): A pager for viewing large files or output incrementally.
- [**readline**](https://tiswww.case.edu/php/chet/readline/rltop.html): Library for command-line editing in shells like bash.
- [**ncurses**](https://www.gnu.org/software/ncurses/): Library for creating text-based user interfaces in terminals.
- [**tldr**](https://tldr.sh/): Provides simplified, community-driven man pages for quick command references.

## Multimedia and Data Processing

- [**ffmpeg**](https://ffmpeg.org/): A powerful tool for audio/video processing, conversion, and streaming.
- [**exiftool**](https://exiftool.org/): Reads, writes, and edits metadata in image, audio, and video files.
- [**libandroid-glob**](https://github.com/termux/termux-packages): Library for glob pattern matching on Android.
- [**libandroid-selinux**](https://github.com/termux/termux-packages): Library for SELinux functionality on Android.
- [**libandroid-support**](https://github.com/termux/termux-packages): Compatibility library for Android-specific features in Termux.
- [**libsmartcols**](https://github.com/karelzak/util-linux): Library for formatting tabular output, used by `util-linux`.

## Compression and Cryptographic Libraries

- [**libbz2**](https://sourceware.org/bzip2/): Library for bzip2 compression, used by tools like `tar`.
- [**liblz4**](https://lz4.github.io/lz4/): Library for fast LZ4 compression, used by various tools.
- [**liblzma**](https://tukaani.org/xz/): Library for XZ and LZMA compression, used by `xz-utils`.
- [**libmd**](https://www.hadrons.org/software/libmd/): Library for MD5 hashing, used for checksums.
- [**libgmp**](https://gmplib.org/): Library for arbitrary-precision arithmetic, used in cryptographic tools.
- [**libmpfr**](https://www.mpfr.org/): Library for multiple-precision floating-point computations.
- [**libiconv**](https://www.gnu.org/software/libiconv/): Library for character encoding conversion.
- [**libunistring**](https://www.gnu.org/software/libunistring/): Library for Unicode string handling.
- [**pcre2**](https://www.pcre.org/): Library for Perl-compatible regular expressions, used by `grep` and others.

## System Libraries

- [**libc++**](https://libcxx.llvm.org/): C++ standard library for Termux, used by C++ applications.
- [**libcap-ng**](https://people.redhat.com/sgrubb/libcap-ng/): Library for managing POSIX capabilities for privilege control.
- [**libevent**](https://libevent.org/): Event-handling library for asynchronous I/O in networking tools.

## Miscellaneous Tools

- [**age**](https://github.com/FiloSottile/age): A simple, modern tool for file encryption using public-key cryptography.
- [**ani-cli**](https://github.com/pystardust/ani-cli): A command-line tool for streaming and downloading anime content.
- [**command-not-found**](https://github.com/termux/termux-packages): Suggests packages when a command is not found in Termux.
- [**dialog**](https://invisible-island.net/dialog/): Creates text-based dialog boxes for scripts (e.g., menus, prompts).
- [**taskwarrior**](https://taskwarrior.org/): A command-line task manager for organizing tasks, due dates, and priorities.

## Notes
- Many libraries (e.g., `lib*`) serve as dependencies for other tools, providing functionality like compression, encryption, or networking.
- Termux-specific packages (e.g., `termux-api`, `termux-tools`) enable integration with Android features.
- To install a package, use `pkg install <package>` in Termux.
- For further details or contributions, visit the [Termux Packages Repository](https://github.com/termux/termux-packages).
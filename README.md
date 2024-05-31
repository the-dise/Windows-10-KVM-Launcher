# Windows 10 KVM Launcher

This project includes a script to start a Windows 10 KVM virtual machine and a desktop entry to easily launch it from your desktop environment.

## Project Structure
```shell
   .
   ├── install.sh           # Script to install the desktop entry
   ├── main.sh              # Script to start and manage the KVM
   ├── src
   │   └── windows.svg      # Icon for the desktop entry
   └── windows10.desktop    # Desktop entry file
```

## Installation

1. Clone the repository or download the files to your local machine.

2. Run the `install.sh` script to install the desktop entry:

   ```bash
	   chmod +x install.sh
      ./install.sh
   ```

   This script will:

   - Copy the `windows10.desktop` file to `~/.local/share/applications`.
   - Copy the `windows.svg` icon to `~/.local/share/icons`.
   - Move `main.sh` to `~/.local/bin/main.sh` and make it executable.
   - Update the paths in `windows10.desktop` to point to the correct locations.

## Usage

After installation, you should see a new application called "Windows 10" in your application launcher. Clicking on it will start the Windows 10 KVM virtual machine.

## Files

- **install.sh**: Installs the desktop entry and icon, and moves the main script to the appropriate location.
- **main.sh**: Starts the Windows 10 KVM virtual machine and opens the viewer. This script also handles suspending the VM when the viewer is closed.
- **src/windows.svg**: Icon for the desktop entry.
- **windows10.desktop**: Desktop entry file to launch the Windows 10 KVM.

## Credits

[Papirus Development Team](https://github.com/PapirusDevelopmentTeam) - for desktop entry icon

## License

This project is licensed under the [MIT](LICENSE) license.
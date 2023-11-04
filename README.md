<a name="readme-top"></a>

# aur-updater

<div align="center">
    <img src="logo.png" alt="Logo" width="80" height="80">
</div>

<details>
    <summary>Contents</summary>
    <ol>
        <li>
            <a href="#introduction">Introduction</a>
        </li>
        <li>
            <a href="#usage">Usage</a>
        </li>
        <li>
            <a href="#process">Process</a>
        </li>
        <li>
            <a href="#project-status">Project Status</a>
        </li>
        <li>
            <a href="#contributions">Contributions</a>
        </li>
    </ol>
</details>

## Introduction

aur-updater is a simple customizable bash script designed for iterating through Arch Linux AUR packages, updating them with git, installing updates, and performing cleanup tasks. 

## Usage

To get started, make sure to make the script executable by running:

```bash
chmod +x aur-updater.sh
```

Then, please change the build variable to the real path of the folder where you keep your AUR packages. This script assumes that all AUR packages are organized in one directory and reside in their own subdirectories, created during the initial git clone from the AUR. Keep in mind that this script does not account for spaces in directory names, so be cautious when giving custom names to AUR folders.
Process

The script will iterate through every AUR directory, perform a git pull, and if it detects an update, it will mark the AUR package as needing an update. It will then inform the user and prompt them for an update. Please note that updating will require sudo privileges, and the script will prompt for sudo. The script was not intended to be run as root for safety reasons, as it's generally not advisable to iterate over file trees with the intent of modification as root. Additionally, makepkg should not run as root.

Afterwards, the script will execute git clean -dfx to clear the files needed to make the package.
Project Status

This project is not currently active, but it welcomes contributors. It's worth noting that there are known bugs, and your contributions can help improve the project's functionality.
Contributions

We welcome contributions to the aur-updater project. If you encounter any issues, have suggestions for improvements, or want to contribute code, please feel free to open an issue or submit a pull request. Your assistance is greatly appreciated as we work to enhance the project's capabilities.

<p align="center">[<a href="#readme-top">RETURN TO TOP</a>]</p>

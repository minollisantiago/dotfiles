# My dotfiles

## Screenshots

Nvim (LazyVim):
![lazyvim_home](images/Captura_2.PNG)
![lazyvim_ui](images/Captura_1.PNG)
![Powershell](images/Captura_4.PNG)

Terminal with terminal icons and firacode Mono:
![Powershell](images/Captura_3.PNG)

Dotfiles for:

- **neovim** with [lazyvim](https://www.lazyvim.org/)
- **powershell** with [oh-my-posh](https://ohmyposh.dev/)
- **vscode** vim motions and custom keybinds + other settings

Themes im using for neovim and vscode:

- **nvim:** [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- **vscode:** [Solarized-Osaka for vscode](https://github.com/sherloach/vscode-theme-solarized-osaka). Original by Devaslife [Solarized-osaka for nvim](https://github.com/craftzdog/solarized-osaka.nvim)

Nerd font im using:

- **Terminal/nvim and vscode**: [Fira Code Mono](https://github.com/tonsky/FiraCode)
- **Installation:** [Oh-my-posh fonts install docs](https://ohmyposh.dev/docs/installation/fonts)

## Dotfiles references

In descending order of relevance for my setup:

##### Powershell: oh-my-posh, nvim, nodejs, terminal-icons install and some other initial configurations, by [Devaslife](https://www.youtube.com/@devaslife)

[![Video](https://img.youtube.com/vi/5-aK2_WwrmM/maxresdefault.jpg)](https://www.youtube.com/watch?v=5-aK2_WwrmM&t=1771s)

##### Nvim setup with lazy: LazyVim config, keymaps, telescope, theme setup and other general configurations, by [Devaslife](https://www.youtube.com/@devaslife)

[![Video](https://img.youtube.com/vi/fFHlfbKVi30/maxresdefault.jpg)](https://www.youtube.com/watch?v=fFHlfbKVi30&t=2238s)

##### Zero to IDE with lazyVim by [Elijah Manor](https://www.youtube.com/@ElijahManor)

[![Video](https://img.youtube.com/vi/N93cTbtLCIM/maxresdefault.jpg)](https://www.youtube.com/watch?v=N93cTbtLCIM&list=PL4UMjyVQYX-Fhbp9kPziRH13caNcO9qMg&index=19)

##### Oh-my-posh for powershell: intro by [HolaMundo](https://www.youtube.com/@HolaMundoDev)

[![Video](https://img.youtube.com/vi/6SGIFVJ5Izs/maxresdefault.jpg)](https://www.youtube.com/watch?v=6SGIFVJ5Izs)

## Vim motions i use (some)

Wrote this up when i was practicing the motions to help me remember them. Some of them are vscode only, as i started first learning motions in vscode and later transitioned to neovim.

### Vertical motions

- **hjkl: j // k =** to move down/up
- **{ // } =** go up/down a block of code
- **ctrl-d // ctrl-u =** go down/up half a page
- **G // gg =** go to the bottom/to the top of the file
- **zz =** centers the cursor at the middle of the screen
- **/{word} =** Search for {word} then press enter and jump through all matches with n (down) or shift-n (up)
- **?{word} =** Search for {word} backwards, then press enter and invert the search done with /
- **{\*} while highlighting a word =** "saves" the highlighted word, then press n or shift-n to jump through all matches (up/down)
- **:{number} =** moves the cursor to line {number}

### Horizontal motions

- **hjkl: h // l =** to move left/right
- **w / b =** moves to the beginning of the next/previous word
- **e =** moves the cursor to the end of the next word
- **E =** moves the cursor to the next non-alphanumeric character (commas, parenthesis, etc)
- **f+{character} =** takes you to that character inside a line (included)
- **t+{character} =** takes you to that character inside a line (not included)
- **; // , after f/t+{character} =** jump forward/backwards between the selected {character}
- **0 =** takes you to the beginning of the line
- **$ =** takes you to the end of the line

### Commands/Actions

- **d =** delete, also copys to clipboard
- **c =** change, deletes and moves to insert mode
- **dd =** delete line
- **cc =** change line, deletes it and moves to inser mode
- **shift + d =** delete line from cursor
- **shift + c =** delete line from cursor and enter insert mode
- **y =** copy to clipboard
- **yy =** copy (yank) line to clipboard
- **p =** paste. If we have a complete line on the clipboard, paste line below the cursor
- **shift-p =** paste. If we have a complete line on the clipboard, paste line above the cursor
- **u =** undo last
- **ctrl+r =** redo last
- **o =** adds a newline below and moves to insert mode
- **O =** adds a newline above and moves to insert mode
- **i =** moves into insert mode, back of the cursor
- **a =** moves into insert mode, front of the cursor
- **shift + i =** sends you to the beginning of the line and puts you into insert mode
- **shift + a =** sends you to the end of the line and puts you into insert mode
- **~ =** changes upper/lower to lower/upper case
- **. =** redo last command
- **v =** move to visual mode, can select code with movement
- **shift + v =** move to visual mode, can select lines with movement
- **ctrl + v =** block visual mode, to select blocks

Commands can be combined with motion to have enhanced effects:

### My navigation commands and keymaps

- **leader+q =** Close editor/file
- **leader+w =** Save file
- **leader+x =** Save file and close it
- **leader+v =** Split screen vertically
- **leader+h =** Split screen horizontally
- **leader+c =** on visual mode, comment line
- **tab // shift-tab =** Tab navigation
- **ctrl-d // ctrl+u =** combined with zz to move down/up and center view
- **ctrl+shift+n =** While on the editor, open new vscode project
- **tab // shift-tab [insert or visual mode] =** indent line, if you combine with movement you can indent blocks

### File tree

- **ctrl-e =** open/close file tree
- **jk =** Move down/up inside the file tree
- **h =** Close folder (if opened)
- **l =** Open file or folder
- **n =** Create new file inside current location on the tree
- **ctrl-n =** Create and open new file
- **ctrl+shift+n =** Create new folder inside current location on the tree

### Console

- **ctrl+j =** Open/close console
- **ctrl+shift+j =** Open new console
- **ctrl+shift+q =** Terminate console
- **ctrl+shift+(a/b) =** Move up/down between running consoles

### Harpoon

- **leader+a =** add file to the harpoon editor list
- **leader+e =** open harpoon editor filelist, editable
- **leader+i (number) =** open the ith editor previously stored

## Some tricks

- **d-i-W =** delete all words until hitting whitespace on both sides (right and left), applies for all commands (c, v, d).
- **d-i-q =** delete all contents inside quotes, applies for all commands (c, v, d).
- **dii =** delete all contents at identation level, applies for all commands (c, v, d).
- **ctrl-d and ctrl-u =** changed settings to add zz to each command, this centers the cursor and so the code "travels" up and down with the cursor always fixed at the center of the screen. **Best way to move vertically**
- **trick:** select a number of lines with visual mode, then press shift-i to trigger insert mode on all of them
- **%:** standing on a character, sends the cursor to the same type of character, works well with visualmode to select code between {[]}
- **some combos:**
  - **d + t + {character} =** delete line up to {character}
  - **c + t + {character} =** delete up to {character} and go into insert mode
  - **press \* to select all matching words then type: :%s//new_word+enter =** replace all occurrences with new_word
  - **shift + V [Visual mode line] + select lines + tab/shift+tab =** indents a block of code
  - **ctrl + shift + v =** open markdown server

## Resources (motions)

##### Vim motions intro by The Primeagen

[![Video](https://img.youtube.com/vi/X6AR2RMB5tE/maxresdefault.jpg)](https://www.youtube.com/watch?v=X6AR2RMB5tE&list=PL4UMjyVQYX-Fhbp9kPziRH13caNcO9qMg&index=3&pp=gAQBiAQB)

##### Vim motions - horizontal by the Primeagen

[![Video](https://img.youtube.com/vi/5JGVtttuDQA/maxresdefault.jpg)](https://www.youtube.com/watch?v=5JGVtttuDQA&list=PL4UMjyVQYX-Fhbp9kPziRH13caNcO9qMg&index=4&t=349s)

##### Vim motions - vertical by the Primeagen

[![Video](https://img.youtube.com/vi/KfENDDEpCsI/maxresdefault.jpg)](https://www.youtube.com/watch?v=KfENDDEpCsI&list=PL4UMjyVQYX-Fhbp9kPziRH13caNcO9qMg&index=5)

##### Vim motions for vscode by MelkeyDev, [settings.json and keybinds.json files for vscode](https://github.com/Melkeydev/vscode_bindings)

[![Video](https://img.youtube.com/vi/GST8we5uABo/maxresdefault.jpg)](https://www.youtube.com/watch?v=GST8we5uABo)

##### Vim Tutorial by Ben Awad

[![Video](https://img.youtube.com/vi/IiwGbcd8S7I/maxresdefault.jpg)](https://www.youtube.com/watch?v=IiwGbcd8S7I&list=PL4UMjyVQYX-EsTmFDgKK_3yld_xiFcRXO&index=31&t=2315s)


# LLM Finetuning

In this project, we will be finetuning a LLM using the Hugging Face framework and unsloth library.

Certainly! Here's a summarized version of our conversation, focusing on the topics you mentioned. The content is formatted in Markdown so you can easily use it for a GitHub `README.md` file.

---

# How to setup WSL with GPU support

This "guide" covers the installation and setup of WSL2 on a Windows machine, enabling GPU support, managing Linux distributions, installing Anaconda, and cloning a GitHub repository using SSH.

## 1. Installing and Enabling WSL2 on Windows

### Check if You Have WSL2 or WSL1

To determine whether you have WSL1 or WSL2 installed:

```bash
wsl -l -v
```

The output will show the version of each installed distribution.

### Install WSL2

If WSL is not installed, you can install it using the following command in PowerShell:

```powershell
wsl --install
```

Set WSL2 as the default version:

```powershell
wsl --set-default-version 2
```

## 2. Enable Virtual Machine Platform and Virtualization

### Enable Virtual Machine Platform

Run the following command in PowerShell as Administrator:

```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

### Enable Virtualization in BIOS

1. Restart your computer and enter the BIOS/UEFI settings (usually by pressing `F2`, `F10`, `F12`, or `Delete` during startup).
2. Find and enable the virtualization option (e.g., Intel VT-x, Intel Virtualization Technology, SVM Mode, or AMD-V).
3. Save and exit the BIOS.

## 3. Install a Custom Linux Version via Microsoft Store

### Install from Microsoft Store

1. Open the Microsoft Store and search for the Linux distribution you want to install.
2. Install your preferred distribution.

### Check Available Linux Distributions via Terminal

To see a list of all available Linux distributions:

```powershell
wsl --list --online
```

## 4. Update Ubuntu Package List and Packages in WSL

To update the package list and upgrade installed packages:

```bash
sudo apt update
sudo apt upgrade -y
```

To perform a full upgrade:

```bash
sudo apt full-upgrade -y
```

## 5. Change the Default WSL Distribution

If you have multiple distributions installed, you can set a default one:

```bash
wsl --set-default <DistributionName>
```

## 6. Start a WSL Distribution

### Start the Default Distribution

```powershell
wsl
```

### Start a Specific Distribution

```powershell
wsl -d <DistributionName>
```

## 7. Access WSL Files from Windows

WSL files can be accessed using a special path. Example of opening a file in Neovim:

```powershell
nvim \\wsl$\Ubuntu-24.04\home\your-username\file.txt
```

Replace `Ubuntu-24.04` and `your-username` with your actual distribution name and username.

## 8. Set Up a Shortcut for Easy Access

### Access WSL from PowerShell

Add the following alias to your PowerShell profile (`$PROFILE`):

```powershell
Set-Alias wslhome "cd \\wsl$\Ubuntu-24.04\home\your-username"
```

### Access WSL from Bash

Add this alias to your `~/.bashrc` file in WSL:

```bash
alias wslhome='cd /mnt/c/Users/YourWindowsUsername'
```

## 9. Set Up WSL2 to Support GPU and Verify

### Install the Latest GPU Drivers

- **For NVIDIA GPUs**: [NVIDIA CUDA on WSL](https://developer.nvidia.com/cuda/wsl)
- **For AMD GPUs**: [AMD Drivers](https://www.amd.com/en/support)
- **For Intel GPUs**: [Intel Graphics Drivers](https://www.intel.com/content/www/us/en/download-center/home.html)

### Install CUDA Toolkit (for NVIDIA GPUs)

```bash
sudo apt-get update
sudo apt-get -y install cuda
```

### Verify GPU Support

```bash
nvidia-smi
```

## 10. Install Anaconda/Miniconda on WSL and Verify

### Install Miniconda

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh
```

### Install Anaconda

```bash
wget https://repo.anaconda.com/archive/Anaconda3-latest-Linux-x86_64.sh -O ~/anaconda.sh
bash ~/anaconda.sh
```

### Initialize and Verify Installation

After installation, either restart your terminal or manually source the configuration:

```bash
source ~/.bashrc
```

Verify Conda installation:

```bash
conda --version
```

## 11. Clone a GitHub Repository into WSL Using SSH

### Set Up SSH Keys

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Add your SSH key to your GitHub account, then test the connection:

```bash
ssh -T git@github.com
```

### Clone the Private Repository

```bash
git clone git@github.com:username/private-repo.git
```

Replace `username` and `private-repo` with your GitHub username and the repository name.

---

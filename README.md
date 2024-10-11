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

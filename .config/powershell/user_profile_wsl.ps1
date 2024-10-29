#OhMyPosh
Import-Module posh-git
Import-Module Terminal-Icons -Force
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'santiago.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

#PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView

#Fuzzy finder: Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl-r'

#Fuzzy finder: open cat explorer mode with fuzzy finder (kinda like telescope)
function Fuzz-Preview {
  fzf --preview="bat --color=always {}"
}

function Fuzz-Preview-Nvim {
  nvim $(fzf -m --preview="bat --color=always {}")
}

# Display working directory contents
function ll {
    Get-ChildItem -Force
}

# Navigation shortcuts
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }

# My workspace: location shortcuts example
function my-custom-Workspace {
  Set-Location /mnt/f/some/random/folder
}

# Alias
Set-Alias vim nvim
Set-Alias cc clear
Set-Alias ls ll
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ff Fuzz-Preview
Set-Alias nff Fuzz-Preview-Nvim

# Workspace alias
Set-Alias ws1 my-custom-Workspace

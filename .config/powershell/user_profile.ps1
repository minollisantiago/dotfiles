
#OhMyPosh
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Terminal-Icons
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'santiago.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

#PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView

#Fuzzy finder: Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl-r'

# Alias
Set-Alias vim nvim
Set-Alias cc clear
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

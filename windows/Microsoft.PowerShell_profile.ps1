using namespace System.Management.Automation
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme paradox

#Hide username@domain
$DefaultUser = 'rajpr'

function ws { Set-Location C:\Users\rajpr\workspace }

function Al { Set-Location C:\Users\rajpr\AppData\Local}

function df { Set-Location C:\Users\rajpr\workspace\dotfiles}

Import-Module PSReadLine

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key Ctrl+n -Function MenuComplete

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key Ctrl+k -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Ctrl+j -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Shift+Tab -Function TabCompleteNext
Set-PSReadLineKeyHandler -Key Tab -Function TabCompletePrevious
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History


# Set-PSReadLineOption -Colors @{Prediction = 'DarkGreen'}

function :q {exit(0)}

Set-Alias -Name iv -Value ImageViewer
Set-Alias -Name list -Value Get-ChildItem
Set-Alias -Name nn -Value nvim
Set-Alias -Name tk -Value task
Set-Alias -Name vf -Value vifm
function nnp {nvim --noplugin}

# Autocompletion for powershell.
#
# You need to either copy the content of this file to $PROFILE or call this
# script directly.
#


Register-ArgumentCompleter -Native -CommandName 'lf' -ScriptBlock {
    param($wordToComplete)
    $completions = @(
        [CompletionResult]::new('-command ', '-command', [CompletionResultType]::ParameterName, 'command to execute on client initialization')
        [CompletionResult]::new('-cpuprofile ', '-cpuprofile', [CompletionResultType]::ParameterName, 'path to the file to write the CPU profile')
        [CompletionResult]::new('-doc', '-doc', [CompletionResultType]::ParameterName, 'show documentation')
        [CompletionResult]::new('-last-dir-path ', '-last-dir-path', [CompletionResultType]::ParameterName, 'path to the file to write the last dir on exit (to use for cd)')
        [CompletionResult]::new('-memprofile ', '-memprofile', [CompletionResultType]::ParameterName, 'path to the file to write the memory profile')
        [CompletionResult]::new('-remote ', '-remote', [CompletionResultType]::ParameterName, 'send remote command to server')
        [CompletionResult]::new('-selection-path ', '-selection-path', [CompletionResultType]::ParameterName, 'path to the file to write selected files on open (to use as open file dialog)')
        [CompletionResult]::new('-server', '-server', [CompletionResultType]::ParameterName, 'start server (automatic)')
        [CompletionResult]::new('-version', '-version', [CompletionResultType]::ParameterName, 'show version')
    )

    if ($wordToComplete.StartsWith('-')) {
        $completions.Where{ $_.CompletionText -like "$wordToComplete*" } | Sort-Object -Property ListItemText
    }
}

# Import-Module Get-ChildItemColor

# If (-Not ( Test-Path Variable:PSise)) {
#    Only run this command in console not in the ISE
 #    Import-Module Get-ChildItemColor

  #   Set-Alias l Get-ChildItemColor -option AllScope
   #  Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
#}

Clear-Host

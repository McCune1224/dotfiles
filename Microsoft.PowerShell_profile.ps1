# Hemove highlighting from directories
$PSStyle.FileInfo.Directory = ""

# Bash like tab completion
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Emacs BABYYYY
Set-PSReadLineOption -EditMode Emacs

# Scroll auto complete from previous history
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward


Import-Module posh-git

function prompt
{
  
  $prompt = & $GitPromptScriptBlock
  $p = $executionContext.SessionState.Path.CurrentLocation
  $osc7 = ""
  if ($p.Provider.Name -eq "FileSystem")
  {
    $ansi_escape = [char]27
    $provider_path = $p.ProviderPath -Replace "\\", "/"
    $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
  }
  # $prompt += "[${osc7} $p$('󰨡 ' * ($nestedPromptLevel + 1))]";
  "${osc7}${prompt}"
  
}

# alias to start having nvim listen on localhost port (used for Godot + External Editor)
function gvim
{ 
  & nvim --listen 127.0.0.1:42069 
}



# function prompt
# {
#   $loc = Get-Location
#
#   $prompt = & $GitPromptScriptBlock
#
#   $prompt += "$([char]27)]9;12$([char]7)"
#   if ($loc.Provider.Name -eq "FileSystem")
#   {
#     $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
#   }
#
#   $prompt
# }

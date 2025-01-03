$PSStyle.FileInfo.Directory = ""
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\mccune.omp.json" | Invoke-Expression

Import-Module posh-git
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
  $prompt
  
}

# Aliases
# Or alternatively, use Set-Alias with the function
# Set-Alias -Name "gvim" -Value nvim-listen

function gvim
{ 
  & nvim --listen 127.0.0.1:42069 
}


function Get-ScriptDirectory
{
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}

$videoDirectory = Get-ScriptDirectory
$watchedTag = ' - WATCHED'

cd $videoDirectory
$videos = get-childitem . -exclude *$watchedTag*
$currentVid = $videos[0]
$currentExtension = $videos[0].extension

$newName = "$currentVid$watchedTag$currentExtension" 
rename-item $currentVid $newName
Invoke-item $newName
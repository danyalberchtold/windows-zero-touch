clear
# ASCII-Art
$asciiArt = @"
     _____                 _____                 _     
    / _  / ___ _ __ ___   /__   \___  _   _  ___| |__  
    \// / / _ \ '__/ _ \    / /\/ _ \| | | |/ __| '_ \ 
     / //\  __/ | | (_) |  / / | (_) | |_| | (__| | | |
    /____/\___|_|  \___/   \/   \___/ \__,_|\___|_| |_|

"@

# ASCII-Art ausgeben
Write-Output $asciiArt
Write-Output "    Language:     [de-CH]"
Write-Output "    Edition:      [Pro N]"
#$lang = Read-Host -Prompt "    Edition: [Pro N]"

Add-Type -AssemblyName System.Windows.Forms

Push-Location

$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    Title = 'Select Windows Image...'
}

if($FileBrowser.ShowDialog() -ne "OK") { 
    exit
}

Pop-Location
$ImagePath = $FileBrowser.FileName
Write-Host "    ISO:          [$ImagePath]"

$mount = Mount-DiskImage -ImagePath $ImagePath -PassThru
$driveLetter = ($mount | Get-Volume).DriveLetter

Write-Output "    Mounted:      [$driveLetter]"

$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Select Destination Folder..."

if ($folderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $DestinationPath = $folderBrowser.SelectedPath
    Write-Host "    Destination: [$DestinationPath]"
} else {
    Write-Output "No folder selected. Exiting script."
    exit
}

$SourcePath = "$driveLetter" + ":\*"
Copy-Item -Path $SourcePath -Destination $DestinationPath -Recurse

Dismount-DiskImage -ImagePath $ImagePath


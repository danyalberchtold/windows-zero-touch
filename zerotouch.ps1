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
Write-Host "$ImagePath"


$mount = Mount-DiskImage -ImagePath $ImagePath -PassThru
$driveLetter = ($mount | Get-Volume).DriveLetter


Write-Output "Mounted image at drive letter: $driveLetter"

#...
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Select Destination Folder..."

if ($folderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $DestinationPath = $folderBrowser.SelectedPath
    Write-Host "$DestinationPath"
} else {
    Write-Output "No folder selected. Exiting script."
    exit
}

$SourcePath = "$driveLetter" + ":\*"
Copy-Item -Path $SourcePath -Destination $DestinationPath -Recurse

Dismount-DiskImage -ImagePath $ImagePath
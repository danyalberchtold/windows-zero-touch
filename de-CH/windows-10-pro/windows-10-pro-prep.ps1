$FolderPath = "D:\ZT\windows-10-src"

# Delete the bootfix.bin
Remove-Item (Join-Path $FolderPath "boot\bootfix.bin") -Force

# Rename the efisys files
Rename-Item (Join-Path $FolderPath "efi\microsoft\boot\efisys.bin") "efisys_prompt.bin" 
Rename-Item (Join-Path $FolderPath "efi\microsoft\boot\efisys_noprompt.bin") "efisys.bin" 

# Rename install.esd to install.wim
If (Test-Path $(Join-Path $FolderPath "source\install.esd")){
	Rename-Item $(Join-Path $FolderPath "source\install.esd") "install.wim"
}
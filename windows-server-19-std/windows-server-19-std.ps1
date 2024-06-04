$FolderPath = "D:\ZT\windows-19-src"
$NewISO = 'D:\ZT\windows-19-iso\windows-19-zt.iso'

$DevToolsDirectory = "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\"
$command = $(Join-Path $DevToolsDirectory 'amd64\Oscdimg\oscdimg.exe')
$arguments = '-m','-o','-u2','-udfver102',"-bootdata:2#p0,e,b$(Join-Path $FolderPath 'boot\etfsboot.com')#pEF,e,b$(Join-Path $FolderPath 'efi\microsoft\boot\efisys.bin')",$FolderPath,$NewISO

& $command $arguments
curl -o DockerDesktopInstaller.exe "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"

# Install Docker Desktop
Start-Process -FilePath DockerDesktopInstaller.exe -ArgumentList '/quiet' -Wait

# Clean up the installer
Remove-Item DockerDesktopInstaller.exe
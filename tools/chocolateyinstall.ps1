#Write-Host "Oracle JDK 17 License Update (October 2024):"
#Write-Host "This installation is subject to the Oracle Technology Network License Agreement for Oracle Java SE."
#Write-Host "Permitted uses include personal and development use at no cost."
#Write-Host "Other uses may require a commercial license."
#Write-Host "Review the terms at: https://www.oracle.com/downloads/licenses/java-se-license.html"
#Write-Host "By continuing, you agree to these terms."

$packageArgs = @{
  PackageName = $env:ChocolateyPackageName
  Url64bit = 'https://download.oracle.com/java/17/archive/jdk-17.0.12_windows-x64_bin.msi'
  Checksum64 = '1bba48b74318f329899b92ed06773d97980722be8c213923f79bcf1cbaf67316'
  ChecksumType64 = 'sha256'
  fileType      = 'msi'
  silentArgs    = "INSTALLLEVEL=3 /quiet"
}

Install-ChocolateyPackage @packageArgs

# Set JAVA_HOME
$jdkInstallPath = "C:\Program Files\Java\jdk-17"
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", $jdkInstallPath, [System.EnvironmentVariableTarget]::Machine)

# Update PATH
$path = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
$newPath = "$path;$($jdkInstallPath)\bin"
[System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)

Write-Host "JAVA_HOME set to $jdkInstallPath and added to PATH."
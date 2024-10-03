# Get-SHA256Hash.ps1

# Define the parameter
param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

# Check if the file exists
if (-Not (Test-Path $FilePath)) {
    Write-Host "Error: The specified file '$FilePath' does not exist."
    exit 1
}

# Get the SHA256 hash of the file
$hash = Get-FileHash -Algorithm SHA256 -Path $FilePath

# Output the hash result
Write-Host "The SHA256 hash of the file '$FilePath' is: $($hash.Hash)"


To add the SHA256 hash to the clipboard in PowerShell, you can use the Set-Clipboard cmdlet. This will copy the hash to the system clipboard, so you can paste it elsewhere.

Here's the updated Get-SHA256Hash.ps1 script with clipboard functionality:

Updated Script: Get-SHA256Hash.ps1
powershell
Code kopieren
# Get-SHA256Hash.ps1

# Define the parameter
param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

# Check if the file exists
if (-Not (Test-Path $FilePath)) {
    Write-Host "Error: The specified file '$FilePath' does not exist."
    exit 1
}

# Get the SHA256 hash of the file
$hash = Get-FileHash -Algorithm SHA256 -Path $FilePath

# Output the hash result
Write-Host "File: '$FilePath'\nSHA256-hash: '$($hash.Hash)'"

# Copy the hash to the clipboard
$hash.Hash | Set-Clipboard

# Notify the user that the hash has been copied
Write-Host "The hash has been copied to the clipboard."
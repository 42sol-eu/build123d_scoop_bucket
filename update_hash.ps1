# Update-ManifestHash.ps1

# Define the parameters
param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath,          # Path to the file for which to compute the hash
    [Parameter(Mandatory=$true)]
    [string]$ManifestPath       # Path to the JSON manifest
)

# Check if the file exists
if (-Not (Test-Path $FilePath)) {
    Write-Host "Error: The specified file '$FilePath' does not exist."
    exit 1
}

# Check if the manifest exists
if (-Not (Test-Path $ManifestPath)) {
    Write-Host "Error: The specified manifest '$ManifestPath' does not exist."
    exit 1
}

# Get the SHA256 hash of the file
$hash = Get-FileHash -Algorithm SHA256 -Path $FilePath

# Output the hash result
Write-Host "File: '$FilePath'\nSHA256-hash: '$($hash.Hash)'"

# Load the JSON manifest file
$manifest = Get-Content $ManifestPath | Out-String | ConvertFrom-Json

# Update the 'hash' field in the manifest
$manifest.hash = $hash.Hash

# Save the updated manifest back to the file
$manifest | ConvertTo-Json -Depth 10 | Set-Content $ManifestPath

# Copy the hash to the clipboard
$hash.Hash | Set-Clipboard

# Notify the user that the hash has been copied and manifest updated
Write-Host "The hash has been copied to the clipboard and updated in the manifest '$ManifestPath'."

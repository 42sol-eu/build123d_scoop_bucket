# Update-ManifestHash.ps1

# Define the parameters
param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath,          # The path to the file for which to check the hash
    [Parameter(Mandatory=$true)]
    [string]$ExpectedHash       # The value of the expected hash
)

$computedHash = (Get-FileHash -Path $FilePath -Algorithm SHA256).Hash

if ($computedHash -eq $ExpectedHash) {
    Write-Host "OK:    The hash '$computedHash' matches."
    exit 0
} else {
    Write-Host "ERROR: The hash '$computedHash' missmatches."
    exit 1
}

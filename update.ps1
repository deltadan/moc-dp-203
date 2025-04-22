$repoOwner = "deltadan"
$repoName = "moc-dp-203"
$fileName = "setup.ps1"
$targetFolder = Join-Path -Path $PSScriptRoot -ChildPath "dp-203/Allfiles/labs/10"
$outputPath = Join-Path -Path $targetFolder -ChildPath $fileName

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $targetFolder)) {
    New-Item -Path $targetFolder -ItemType Directory -Force | Out-Null
    Write-Host "Created directory: $targetFolder"
}

Write-Host "Downloading $fileName from $repoOwner/$repoName repository..."

# Download from main branch
$mainBranchUrl = "https://raw.githubusercontent.com/$repoOwner/$repoName/main/$fileName"
try {
    Invoke-WebRequest -Uri $mainBranchUrl -OutFile $outputPath -ErrorAction Stop
    Write-Host "Successfully downloaded $fileName to $outputPath"
}
catch {
    Write-Host "Error downloading $fileName: $($_.Exception.Message)"
    exit 1
}

Write-Host "Operation completed successfully."

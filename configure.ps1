# Configuration script for AspireTodo

# Check if .NET 8 SDK is installed
$dotnetVersion = dotnet --version
if ($dotnetVersion -notlike "8.*") {
    Write-Host "Error: .NET 8 SDK is not installed. Please install it from https://dotnet.microsoft.com/download/dotnet/8.0" -ForegroundColor Red
    exit 1
}

# Install the .NET Aspire workload
Write-Host "Installing .NET Aspire workload..." -ForegroundColor Cyan
dotnet workload install aspire

# Verify the installation
$aspireWorkload = dotnet workload list | Select-String "aspire"
if ($aspireWorkload) {
    Write-Host ".NET Aspire workload installed successfully." -ForegroundColor Green
} else {
    Write-Host "Error: Failed to install .NET Aspire workload." -ForegroundColor Red
    exit 1
}

# Create the project directory if it doesn't exist
$projectName = "AspireTodo"
if (!(Test-Path $projectName)) {
    New-Item -ItemType Directory -Name $projectName | Out-Null
    Set-Location $projectName
    Write-Host "Created and moved to $projectName directory." -ForegroundColor Green
} else {
    Set-Location $projectName
    Write-Host "Moved to existing $projectName directory." -ForegroundColor Yellow
}

# Create the .NET Aspire project
Write-Host "Creating .NET Aspire project..." -ForegroundColor Cyan
dotnet new aspire-starter -n $projectName

Write-Host "Configuration completed successfully." -ForegroundColor Green
Write-Host "You can now run '.\build.ps1' to build the project." -ForegroundColor Cyan

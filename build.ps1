# Build script for AspireTodo

# Restore dependencies
Write-Host "Restoring dependencies..." -ForegroundColor Cyan
dotnet restore AspireTodo.sln

# Build the solution
Write-Host "Building the solution..." -ForegroundColor Cyan
dotnet build AspireTodo.sln --configuration Release --no-restore

# Run tests (if you have any)
# Write-Host "Running tests..." -ForegroundColor Cyan
# dotnet test AspireTodo.sln --configuration Release --no-build

# Publish the AppHost project
Write-Host "Publishing the AppHost project..." -ForegroundColor Cyan
dotnet publish AspireTodo.AppHost/AspireTodo.AppHost.csproj --configuration Release --no-build --output ./publish

Write-Host "Build completed. Output is in the ./publish directory." -ForegroundColor Green

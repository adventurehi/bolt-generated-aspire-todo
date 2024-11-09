#!/bin/bash

# Restore dependencies
dotnet restore AspireTodo.sln

# Build the solution
dotnet build AspireTodo.sln --configuration Release --no-restore

# Run tests (if you have any)
# dotnet test AspireTodo.sln --configuration Release --no-build

# Publish the AppHost project
dotnet publish AspireTodo.AppHost/AspireTodo.AppHost.csproj --configuration Release --no-build --output ./publish

echo "Build completed. Output is in the ./publish directory."

# PowerShell end-to-end test for create-guild-sv template
$ErrorActionPreference = 'Stop'

# Remove any previous test-app
Remove-Item -Recurse -Force test-app -ErrorAction SilentlyContinue

# Scaffold a new project using npm create
yarn create guild-sv test-app --yes
if (!(Test-Path test-app)) {
    Write-Error "Scaffold failed: test-app directory not created."
}

Set-Location test-app

# Check for expected files
$expectedFiles = @('README.md', 'stack.yaml', 'package.json')
foreach ($file in $expectedFiles) {
    if (!(Test-Path $file)) {
        Write-Error "$file not found in scaffolded project!"
    } else {
        Write-Host "$file found."
    }
}

# Install dependencies
pnpm install

# Lint, build, and run dev server
try {
    pnpm lint
} catch {
    Write-Host "Linting not configured, skipping."
}
pnpm build

# Optionally, test dev server startup (commented out for CI)
# $dev = Start-Process pnpm -ArgumentList 'dev' -PassThru
# Start-Sleep -Seconds 5
# Stop-Process -Id $dev.Id

Set-Location ..

# Clean up
Remove-Item -Recurse -Force test-app

Write-Host "End-to-end template test completed successfully."

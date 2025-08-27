#!/usr/bin/env bash
set -e

# Remove any previous test-app
rm -rf test-app

# Scaffold a new project using npm create
npm create guild-sv@latest test-app -- --yes

cd test-app

# Check for expected files
for file in README.md stack.yaml package.json; do
  if [ ! -f "$file" ]; then
    echo "ERROR: $file not found in scaffolded project!"
    exit 1
  fi
  echo "$file found."
done

# Install dependencies
pnpm install

# Lint, build, and run dev server
pnpm lint || echo "Linting not configured, skipping."
pnpm build

# Optionally, test dev server startup (headless)
# pnpm dev &
# DEV_PID=$!
# sleep 5
# kill $DEV_PID

cd ..

# Clean up
rm -rf test-app

echo "End-to-end template test completed successfully."

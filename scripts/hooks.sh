#!/usr/bin/env bash

echo "Adding husky git hooks:"

npx husky add .husky/commit-msg "npx --no-install commitlint --edit $1"
npx husky add .husky/pre-commit "npm run secrets"

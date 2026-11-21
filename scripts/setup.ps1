#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

git config core.hooksPath .githooks
Write-Host "The repository-managed Git hooks have been activated (core.hooksPath = .githooks)."

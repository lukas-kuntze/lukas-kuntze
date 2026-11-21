#!/usr/bin/env bash

set -euo pipefail

git config core.hooksPath .githooks
echo "The repository-managed Git hooks have been activated (core.hooksPath = .githooks)."

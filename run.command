#!/bin/bash
set -e
cd "$(dirname "$0")"
echo
echo "FLARE - First-time setup and launcher"
echo

if ! command -v python3 >/dev/null 2>&1; then
  echo "Python 3.10 or newer is required. Install it from https://www.python.org/downloads/"
  read -r -p "Press Enter to close..."
  exit 1
fi

if [ ! -x ".venv/bin/python" ]; then
  echo "[1/3] Creating the FLARE Python environment..."
  python3 -m venv .venv
fi

echo "[2/3] Installing or checking required packages..."
.venv/bin/python -m pip install --upgrade pip
.venv/bin/python -m pip install -r backend/requirements.txt

echo "[3/3] Starting FLARE..."
echo "Keep this Terminal window open while using FLARE. Press Ctrl+C to stop."
open http://127.0.0.1:8000
.venv/bin/python -m uvicorn backend.server:app --host 127.0.0.1 --port 8000

#!/usr/bin/env bash
set -e
uvicorn backend.server:app --reload

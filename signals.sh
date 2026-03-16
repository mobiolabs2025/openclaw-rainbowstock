#!/bin/bash
# StockAnalyzer 오늘의 시그널
# Usage: ./signals.sh

set -e
source "$(dirname "$0")/common.sh"
check_api_key

api_get "/api/internal/agent/signals/today"

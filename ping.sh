#!/bin/bash
# StockAnalyzer API 키 검증
# Usage: ./ping.sh

set -e
source "$(dirname "$0")/common.sh"
check_api_key

api_get "/api/internal/agent/ping"

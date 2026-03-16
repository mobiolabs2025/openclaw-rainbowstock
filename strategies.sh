#!/bin/bash
# StockAnalyzer 전략 목록
# Usage: ./strategies.sh

set -e
source "$(dirname "$0")/common.sh"
check_api_key

api_get "/api/internal/agent/strategies"

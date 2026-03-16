#!/bin/bash
# StockAnalyzer 종목 분석
# Usage: ./analyze.sh 005930

set -e
source "$(dirname "$0")/common.sh"
check_api_key

if [ -z "$1" ]; then
  echo "Usage: $0 <stock_code>" >&2
  echo "Example: $0 005930  # 삼성전자" >&2
  exit 1
fi

CODE="$1"

# 종목코드 형식 검증 (숫자 6자리)
if ! [[ "$CODE" =~ ^[0-9]{6}$ ]]; then
  echo "⚠️  Warning: 종목코드는 보통 6자리 숫자입니다 (예: 005930)" >&2
fi

api_post "/api/internal/agent/analyze/${CODE}" "{}"

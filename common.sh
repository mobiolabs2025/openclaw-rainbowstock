#!/bin/bash
# StockAnalyzer 공통 함수

# 스크립트 디렉토리 기준 .env 로드
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$SCRIPT_DIR/.env" ]; then
  while IFS='=' read -r key value; do
    # 주석과 빈 줄 무시
    [[ "$key" =~ ^#.*$ || -z "$key" ]] && continue
    # 따옴표 제거
    value="${value%\"}"
    value="${value#\"}"
    export "$key=$value"
  done < "$SCRIPT_DIR/.env"
fi

# 기본값 설정
API_URL="${SA_API_URL:-https://rainbowstock.net}"
API_KEY="${SA_API_KEY}"

# API 키 확인
check_api_key() {
  if [ -z "$API_KEY" ]; then
    echo "❌ Error: SA_API_KEY가 설정되지 않았습니다." >&2
    echo "" >&2
    echo "설정 방법:" >&2
    echo "  1. 환경변수: export SA_API_KEY=\"sk_live_xxxxx\"" >&2
    echo "  2. .env 파일: $SCRIPT_DIR/.env 생성" >&2
    exit 1
  fi
}

# API 호출 함수 (GET)
api_get() {
  local endpoint="$1"
  curl -s -X GET "${API_URL}${endpoint}" \
    -H "X-API-Key: ${API_KEY}" \
    -H "Accept: application/json"
}

# API 호출 함수 (POST with JSON)
api_post() {
  local endpoint="$1"
  local data="$2"
  curl -s -X POST "${API_URL}${endpoint}" \
    -H "Content-Type: application/json" \
    -H "X-API-Key: ${API_KEY}" \
    -H "Accept: application/json" \
    -d "$data"
}

# JSON 문자열 escape (jq 있으면 사용, 없으면 기본 처리)
json_escape() {
  local str="$1"
  if command -v jq &> /dev/null; then
    echo "$str" | jq -Rs '.'
  else
    # 기본 escape: 백슬래시, 따옴표, 개행
    str="${str//\\/\\\\}"
    str="${str//\"/\\\"}"
    str="${str//$'\n'/\\n}"
    str="${str//$'\r'/\\r}"
    str="${str//$'\t'/\\t}"
    echo "\"$str\""
  fi
}

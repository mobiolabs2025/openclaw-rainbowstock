---
name: stockanalyzer
description: "AI 주식 분석 서비스. 종목 분석, 포트폴리오 관리, 전략 생성/백테스트, 시그널 알림 등."
metadata:
  openclaw:
    emoji: "📈"
    requires:
      bins: ["curl", "jq"]
    api:
      endpoint: "https://rainbowstock.net/api/openclaw/tools"
      auth: "bearer"
---

# StockAnalyzer Skill

주식 분석 서비스 StockAnalyzer와 연동합니다.

## 설정

API 키를 환경변수로 설정하세요:

```bash
export SA_API_KEY="sk_live_xxxxx"
export SA_API_URL="https://rainbowstock.net"
```

또는 이 폴더에 `.env` 파일 생성:
```
SA_API_KEY=sk_live_xxxxx
SA_API_URL=https://rainbowstock.net
```

## 사용 가능한 기능

### 1. 자연어 대화 (챗봇)
```bash
./chat.sh "삼성전자 분석해줘"
./chat.sh "내 포트폴리오 수익률 알려줘"
./chat.sh "RSI 과매도 전략 만들어줘"
```

### 2. 종목 분석
```bash
./analyze.sh 005930  # 삼성전자
./analyze.sh 035720  # 카카오
```

### 3. 오늘의 시그널
```bash
./signals.sh
```

### 4. 전략 목록
```bash
./strategies.sh
```

### 5. 포트폴리오 조회
```bash
./portfolio.sh              # JSON 형식
./portfolio.sh --formatted  # 챗봇용 텍스트
```

### 6. 거래 내역
```bash
./trades.sh              # 최근 30일 (JSON)
./trades.sh 7            # 최근 7일
./trades.sh --formatted  # 챗봇용 텍스트
```

### 7. 투자 성과
```bash
./performance.sh              # JSON 형식
./performance.sh --formatted  # 챗봇용 텍스트
```

### 8. API 키 검증
```bash
./ping.sh
```

## API 엔드포인트 (직접 호출 시)

| 기능 | 메서드 | 엔드포인트 |
|------|--------|-----------|
| 자연어 대화 | POST | `/api/internal/agent/chat` |
| 종목 분석 | POST | `/api/internal/agent/analyze/:code` |
| 오늘의 시그널 | GET | `/api/internal/agent/signals/today` |
| 전략 목록 | GET | `/api/internal/agent/strategies` |
| 포트폴리오 | GET | `/api/internal/agent/portfolio[/formatted]` |
| 거래 내역 | GET | `/api/internal/agent/trades[/formatted]` |
| 투자 성과 | GET | `/api/internal/agent/performance[/formatted]` |
| 연결 확인 | GET | `/api/internal/agent/ping` |

모든 요청에 `X-API-Key` 헤더 필요.

## 파일 구조

```
stockanalyzer/
├── .env.example    # 환경변수 예시
├── .env            # 실제 설정 (직접 생성)
├── common.sh       # 공통 함수
├── SKILL.md        # 이 문서
├── chat.sh         # 자연어 대화
├── analyze.sh      # 종목 분석
├── signals.sh      # 오늘의 시그널
├── strategies.sh   # 전략 목록
├── portfolio.sh    # 포트폴리오
├── trades.sh       # 거래 내역
├── performance.sh  # 투자 성과
└── ping.sh         # 연결 확인
```

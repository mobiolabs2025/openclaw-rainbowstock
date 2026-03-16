# RainbowStock OpenClaw Skill

Control RainbowStock from your terminal via OpenClaw.

## Installation

```bash
git clone https://github.com/mobiolabs2025/openclaw-rainbowstock.git ~/openclaw/skills/rainbowstock
cd ~/openclaw/skills/rainbowstock
cp .env.example .env
# Edit .env with your API key
```

## Setup

1. Get your API key from [RainbowStock Settings](https://rainbowstock.net/settings)
2. Copy to `.env`:

```bash
SA_API_KEY=sk_live_your_key_here
SA_API_URL=https://rainbowstock.net
```

## Available Commands

| Command | Description |
|---------|-------------|
| `./tools.sh` | Get tool definitions for OpenClaw |
| `./chat.sh "message"` | Chat with RainbowStock AI |
| `./portfolio.sh` | View portfolio |
| `./trades.sh` | View trade history |
| `./analyze.sh <stock>` | Analyze a stock |
| `./strategies.sh` | List strategies |
| `./signals.sh` | Get trading signals |
| `./performance.sh` | View performance stats |

## API Endpoints

- **Tools**: `https://rainbowstock.net/api/openclaw/tools`
- **Skill Download**: `https://rainbowstock.net/api/openclaw/skill.zip`
- **Info**: `https://rainbowstock.net/api/openclaw/info`

## Security

- Your API key is personal and should not be shared
- Each key only accesses your own data
- Keys can be revoked in RainbowStock settings

## Support

https://rainbowstock.net

set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]


CHATWOOT_HUB_URL := "https://hub.2.chatwoot.com/events"
CHATWOOT_REPO := "https://github.com/coestudio/chatwoot.git"
CHATWOOT_RAW_BASE := "https://raw.githubusercontent.com/coestudio/chatwoot"
CHATWOOT_BRANCH := "main"

[unix]
clear:
    clear

default:
    @just --list

deploy:
    #!/usr/bin/env bash
    set -e
    clear
    echo "📥 Puxando código..."
    git fetch origin main
    git clean -fd
    git reset --hard origin/main
    clear

install-cli:
    #!/usr/bin/env bash
    set -e
    echo "📥 Instalando cwctl..."
    wget "{{CHATWOOT_RAW_BASE}}/{{CHATWOOT_BRANCH}}/integration/setup.sh" -O /usr/local/bin/cwctl > /dev/null 2>&1 && chmod +x /usr/local/bin/cwctl
    echo "✅ cwctl instalado com sucesso!"
    clear

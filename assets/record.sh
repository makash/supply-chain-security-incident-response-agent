#!/usr/bin/env bash

simulate_typing() {
    local text="$1"
    for (( i=0; i<${#text}; i++ )); do
        printf '%s' "${text:$i:1}"
        sleep 0.03
    done
}

prompt() {
    printf '\033[1;34m❯\033[0m '
}

ok() {
    printf '  \033[1;32m✓\033[0m %s\n' "$1"
}

warn() {
    printf '  \033[1;33m!\033[0m %s\n' "$1"
}

sleep_brief() {
    sleep 0.35
}

clear
sleep 0.4
printf '\033[1mSCIRA demo\033[0m\n'
printf '  Supply Chain Incident Response Agent\n'
printf '  Built-in incidents: LiteLLM (PyPI), Axios (npm)\n\n'
sleep 1.0

prompt
simulate_typing "scira scan litellm --target /srv/python-app"
sleep_brief
echo ""
sleep 0.5
printf '\033[1mStatus:\033[0m likely_affected\n\n'
warn "Found compromised version 1.82.8 in /srv/python-app/requirements.txt"
warn "Found IOC domain models.litellm.cloud in logs/app.log"
printf '\n\033[1mImmediate next steps:\033[0m\n'
printf '1. Isolate the affected host or runner\n'
printf '2. Preserve evidence before cleanup\n'
printf '3. Rotate credentials in scope\n'
sleep 2.0

echo ""
prompt
simulate_typing "scira scan axios --target /srv/node-app"
sleep_brief
echo ""
sleep 0.5
printf '\033[1mStatus:\033[0m likely_affected\n\n'
warn "Found compromised version 1.14.1 in /srv/node-app/package-lock.json"
warn "Found compromised version 4.2.1 in /srv/node-app/node_modules/plain-crypto-js"
printf '\n\033[1mImmediate next steps:\033[0m\n'
printf '1. Isolate the affected CI runner or host\n'
printf '2. Preserve npm evidence and lockfiles\n'
printf '3. Rotate npm, git, cloud, and SSH credentials\n'
sleep 2.0

echo ""
prompt
simulate_typing "scira scan axios --target /srv/node-app --format json --output axios-report.json"
sleep_brief
echo ""
sleep 0.5
ok "Deterministic report written to axios-report.json"
ok "Ready for AI explanation or incident handoff"
printf '\n\033[1mSCIRA\033[0m: deterministic scan first, optional AI explanation second.\n'
sleep 2.0

#!/bin/bash
set -e
# --- Unified Service Tagging ---
export DD_SERVICE="notes"
export DD_ENV="dev"
export DD_VERSION="0.1.0"    # In GitHub Actions, override with commit SHA
export DD_TAGS="team:sre,project:notes-app"

# --- APM Tracing ---
export DD_TRACE_SAMPLE_RATE="1"
export DD_TRACE_ENABLED="true"
export DD_TRACE_DEBUG="false"
export DD_LOGS_INJECTION="true"

# --- Profiling ---
export DD_PROFILING_ENABLED="true"

# --- Runtime Metrics ---
export DD_RUNTIME_METRICS_ENABLED="true"

# --- Infrastructure Monitoring ---
export DD_SITE="us5.datadoghq.com"
export DD_AGENT_HOST="127.0.0.1"
export DD_DOGSTATSD_PORT="8125"

# --- Deployment Metadata (optional: CI/CD overrides these) ---
#if command -v git &> /dev/null; then
#  export DD_GIT_REPOSITORY_URL=$(git config --get remote.origin.url || echo "unknown-repo")
#  export DD_GIT_COMMIT_SHA=$(git rev-parse HEAD || echo "unknown-sha")
#fi

echo "🚀 Starting Notes App with Datadog APM..."
ddtrace-run python3 -m notes_app.app


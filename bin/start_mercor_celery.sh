#!/bin/zsh

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
celery -A app_local.celery worker --loglevel=info --concurrency=2 --prefetch-multiplier=1 -Ofair


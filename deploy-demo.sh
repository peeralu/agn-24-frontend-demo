#!/usr/bin/env bash
set -e

APP_NAME=agn24
XAMPP_HTDOCS=/Applications/XAMPP/xamppfiles/htdocs

# cleanup
rm -f ${APP_NAME}.zip || true

# flutter build
flutter clean
flutter pub get
flutter build web \
  --base-href /${APP_NAME}/ \
  --release \
  --no-tree-shake-icons \
  --pwa-strategy=none

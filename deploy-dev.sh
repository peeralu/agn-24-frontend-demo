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

# prepare build folder
cd build

# copy .htaccess เข้า web
cp ../.htaccess ./web

# rename web -> agn24
rm -rf ${APP_NAME} || true
mv web ${APP_NAME}

# remove old deploy (สำคัญ: ใช้ rm -rf ไม่ใช่ rmdir)
rm -rf ${XAMPP_HTDOCS}/${APP_NAME} || true

# deploy
cp -R ${APP_NAME} ${XAMPP_HTDOCS}/

echo "✅ Deploy ${APP_NAME} to XAMPP htdocs success"

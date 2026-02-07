#!/bin/bash
set -e

if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git
fi

export PATH="$PWD/flutter/bin:$PATH"

flutter doctor
flutter config --enable-web
flutter clean
flutter pub get
flutter build web --release --no-tree-shake-icons --pwa-strategy=none
#!/bin/sh
set -e
npm install -g @nestjs/cli
cd /app
for s in services/api-gateway services/notification-service services/scheduler-service; do
  echo "Scaffolding $s..."
  rm -rf $s/temp_app
  
  cd $s
  nest new temp_app --package-manager npm --skip-git
  cp -r temp_app/. .
  rm -rf temp_app
  cd /app
done

#!/bin/sh
set -e
cd /app
for s in services/auth-service services/formation-service services/registration-service; do
  echo "Scaffolding $s..."
  # Clean potential failed attempts
  rm -rf $s/temp_app
  
  # Create within the service directory to avoid 'replace' issues
  cd $s
  composer create-project --prefer-dist laravel/laravel temp_app --no-interaction
  cp -r temp_app/. .
  rm -rf temp_app
  cd /app
done

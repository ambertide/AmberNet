#! /bin/env sh

username=$(whoami)

git pull
php ../composer.phar update
php vendor/bin/serve.php config.json

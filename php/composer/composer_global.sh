#使用Ubuntu安装php，需要在/etc/php/cli/conf.d/php.ini添加:
# apt install php7.*-json php7.*-phar php7.*-mbstring
# extension=json.so
# extension=phar.so
# extension=iconv.so
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"

php composer-setup.php

php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer

composer config -g repo.packagist composer https://packagist.phpcomposer.com

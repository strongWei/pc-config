#使用Ubuntu安装php，需要在/etc/php/cli/conf.d/php.ini添加(ubuntu安装后会自动添加):
sudo apt install php7.2-json php7.2-phar php7.2-mbstring -y
sudo sh -c 'echo "extension=json.so\nextension=phar.so\nextension=iconv.so" >> /etc/php/7.2/cli/php.ini'


php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"

php composer-setup.php

php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer

composer config -g repo.packagist composer https://packagist.phpcomposer.com

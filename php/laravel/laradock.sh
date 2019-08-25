#!/bin/bash
# 构建Laraveldock
# 请使用source ./laradock.sh 执行

# 克隆代码
folder='./laradock'
if [ ! -d ${folder} ]; then
  git clone https://github.com/Laradock/laradock.git
fi

# 修改配置
cd ${folder}
cp env-example .env

# 运行容器
docker-compose up -d nginx mysql redis beanstalkd


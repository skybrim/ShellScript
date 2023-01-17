#!/bin/sh

# 安装工具
echo ">>>>>>安装基础工具<<<<<<"
sudo apt update
sudo apt install curl wget vim git -y

# 安装 docker
echo ">>>>>>移除旧版本<<<<<<"
sudo apt remove docker docker-engine docker.io containerd runc
# 设置仓库
echo ">>>>>>设置repo<<<<<<"
sudo apt install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# 更新
echo ">>>>>>更新repo<<<<<<"
sudo apt update
# 安装
echo ">>>>>>安装 docker<<<<<<"
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# 安装 docker-compose
echo ">>>>>>安装 docker-compose<<<<<<"
sudo curl -L "https://github.com/docker/compose/releases/download/v2.14.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 输出版本号
echo ">>>>>>安装完成<<<<<<"
sudo docker -v
sudo docker-compose -v


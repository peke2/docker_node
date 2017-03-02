#!/bin/bash

### Dockerのインストールと開始(Vagrant用)
# 環境が更新される可能性があるので、以下のページで手順確認を推奨
# https://docs.docker.com/engine/installation/linux/centos/

# 古いバージョンのdockerを削除
sudo yum -y remove docker docker-common container-selinux
# 最新のdocker-engineと衝突しないよう、これも削除
sudo yum -y remove docker-selinux

# インストール
sudo yum install -y yum-utils
# 安定版リポジトリを登録
sudo yum-config-manager --add-repo https://docs.docker.com/engine/installation/linux/repo_files/centos/docker.repo
# yumパッケージインデックスの更新
sudo yum makecache fast
# docker-engineをインストール
sudo yum -y install docker-engine

#プロダクションでは、インストールする時にバージョンを明示的に指定するべき
#バージョンリストの確認とバージョンを指定したdocker-engineのインストール
#yum list docker-engine.x86_64 --showduplicates |sort -r
#sudo yum -y install docker-engine-<VERSION_STRING>

# dockerを開始
sudo systemctl start docker

# 「sudo」無しでdockerを使えるよう、現在のユーザーをdockerのグループに所属させる
# vagrantでの使用を想定しているので、ユーザーは「vagrant」で固定しておく
sudo gpasswd -a vagrant docker
sudo systemctl restart docker

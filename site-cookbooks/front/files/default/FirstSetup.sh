
#Nodeのバージョン管理アプリであるnvmのインストール
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm --version
nvm ls
nvm ls-remote


#NodeとNpmのインストール（最新安定版）
nvm install stable
nvm use stable

#インストールされたNodeとNpmのバージョン確認
node -v
npm -v


##BOWERはグローバルインストールが必要
npm install -g bower
bower -v

##bootstrap,
mkdir -p ~/bower/bootStrap;cd $_
bower search bootstrap
bower install bootstrap
bower info bootstrap

##jquery 
mkdir -p ~/bower/jquery;cd $_
bower search jquery
bower install jquery
bower info jquery

##angular,
mkdir -p ~/bower/angularjs;cd $_
bower search angularjs
bower install angularjs
bower info angularjs




#GVMの後継であるSDKMANのインストール
su - apl
apl

curl -s api.sdkman.io | bash
source "/home/ec2-user/.sdkman/bin/sdkman-init.sh"
sdk list groovy
sdk install groovy



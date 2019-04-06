# SWV2

```sh
git clone https://github.com/selabswv/SWV2.git #download
cd /SWV2
chmod +x swv_install.sh 
./swv_install.sh # 실행
```
설치 중 `redmine-mysql` 에 관한 설정을 한다.

* 계정 설정
* Database: mysql 선택

`http://localhost/jenkins > jenkins 페이지`  

`http://localhost/redmine > redmine 페이지`  

`http://localhost/index.jsp > 로그인 페이지`


## redmine plugin install 3.x.x version

redmine plugin 사이트 [http://www.redmine.org/plugins?page=1]  

`redmineHomeDir/plugins/` 폴더에 원하는 플러그인 다운로드

#### 설치
```sh
bundle install --without development test --no-deployment
rake redmine:plugins:migrate RAILS_ENV=production  
```  
실패 경우 아래 명령어 수행  
```sh
bundle exec rake redmine:plugins:migrate RAILS_ENV=production
```

#### 삭제

```sh

rake redmine:plugins:migrate NAME=[plugin_name] VERSION=0 RAILS_ENV=production
```
진행 후 
`redmineHome/plugin_assets` 폴더에 있던 플러그인 디렉토리 삭제

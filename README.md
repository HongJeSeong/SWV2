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

`redmineHome/plugin_assets` 폴더에 원하는 플러그인 다운로드

#### 설치
```sh
bundle install --without development test --no-deployment
bundle exec ruby [rails 경로] generate redmine_plugin [plugin-name]  (설치)
```

#### 삭제

```sh
bundle exec ruby [rails 경로] destroy redmine_plugin [plugin-name] (삭제) 

```
진행 후 
`redmineHome/plugin_assets` 폴더에 있던 플러그인 디렉토리 삭제

alias runLocalConfig='mvn clean package spring-boot:run -Dxmd.platform.config.git.uri=file://\$\{user.home\}/projects/xmd/platform-central-configuration/'

alias runFull='mvn clean package spring-boot:run -Dxmd.platform.spring.active.profile=local,fares'
#alias run='MAVEN_OPTS="-Xmx128m" mvn clean package spring-boot:run -Dxmd.platform.spring.jvm.args="-Xmx256m -Dxmd.platform.spring.active.profile=local,fares"'

alias run='MAVEN_OPTS="-Xmx128m" mvn clean package spring-boot:run -Dxmd.platform.spring.jvm.args="-Xmx256m -Dspring.profiles.active=local,fares"'

function runremote()
{
	profile=${1:-remote,local}
	memory=${2:-256}
	MAVEN_OPTS="-Xmx128m" mvn clean package spring-boot:run -Dxmd.platform.spring.jvm.args="-Xmx${memory}m -Dspring.profiles.active=${profile}"
}

function debugremote()
{
        profile=${1:-remote,local}
        export MAVEN_OPTS="-Xmx128m"
        MAVEN_OPTS="-Xmx128m" mvn clean package spring-boot:run -Dxmd.platform.spring.jvm.args="-Xmx256m -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=8000 -Dspring.profiles.active=${profile}"
}

# git alias
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gst='git status'


# docker alias
alias dps='docker ps'

function parse_auth(){
	host=${1:-https://stg-plat-usw1-k8-1.staging-mysagestore.com/api/v/1/oauth2/token}
	store_id=${2:-batteriesexpert}
	echo ${host} 
	echo ${store_id}
	content=$(curl -X POST "${host}" -H "accept: application/json" -H "accept-language: en-US" -H "x-xm-store: ${store_id}" -H "Content-Type: application/x-www-form-urlencoded" -d "grant_type=password&password=app133&username=adminPaul" -u symphony:test) && token=$(jq -r '.access_token' <<< "${content}") && store_id=$(jq -r '.store_id' <<< "${content}") && refresh_token=$(jq -r '.refresh_token' <<< "${content}")
}

function getauth(){
	parse_auth && echo $token | xclip -sel clip
}

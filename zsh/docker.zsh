alias dco="docker compose"
alias dcb="docker compose build"
alias dce="docker compose exec"
alias dcrs="docker compose restart"
alias dcrm="docker compose rm"
alias dcrn="docker compose run"
alias dcrs="docker compose down && docker compose up -d"
alias dcs="docker compose stop"
alias dcup="docker compose up -d"
alias dcdw="docker compose down"
alias dcdwr="docker compose down --remove-orphans"
alias dcl="docker compose logs"
alias dclf="docker compose logs -f"
alias dclz="lazydocker"
alias dcrc="docker compose up -d --build --force-recreate"

alias dcps='docker ps -a --format "{{.ID}}|{{.Status}}|{{.Ports}}|{{.Image}}" | \
awk -F"|" '\''{
  ports=$3
  # Replace spaces with commas
  gsub(/[ \t]+/,",",ports)
  # Split by comma
  n=split(ports,a,",")
  delete seen
  clean=""
  for(i=1;i<=n;i++){
    port=a[i]
    # Remove host IP prefixes
    gsub(/^0\.0\.0\.0:/,"",port)
    gsub(/^\[::\]:/,"",port)
    # Remove /tcp or /udp
    gsub(/\/(tcp|udp)$/,"",port)
    # Handle ranges like 15691-15692 -> keep first port
    split(port,b,"-")
    port=b[1]
    if(port!="" && !(port in seen)){
      seen[port]=1
      clean=(clean=="" ? port : clean","port)
    }
  }
  if(clean=="") clean="-"

  # Clean IMAGE column
  image=$4
  gsub(/^gcr\.io\/com-nethunt-build\//,"",image)
  gsub(/latest/,"^",image)   # replace any "latest" with "^"

  # Shorten STATUS + time
  status=$2
  # Up xx minutes/seconds/hours
  if(status ~ /^Up[ \t]+[0-9]+/) {
    gsub(/ minutes?/,"m",status)
    gsub(/ hours?/,"h",status)
    gsub(/ seconds?/,"s",status)
    status_col="\033[1;32m" status "\033[0m"   # green
  }
  # Exited (code) xx minutes/seconds/hours ago
  else if(status ~ /^Exited/) {
    gsub(/Exited.*?([0-9]+) minutes?.*/,"Down \\1m",status)
    gsub(/Exited.*?([0-9]+) hours?.*/,"Down \\1h",status)
    gsub(/Exited.*?([0-9]+) seconds?.*/,"Down \\1s",status)
    status_col="\033[1;31m" status "\033[0m"   # red
  }
  else {
    status_col="\033[1;33m" status "\033[0m"   # yellow
  }

  printf("\033[90m%-12s\033[0m  %-25s  \033[1;36m%-30s\033[0m  \033[1;32m%-35s\033[0m\n",
         $1, status_col, clean, image)
}'\'


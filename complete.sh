_bssid () {
  local CUR PREV OPTIONS NETWORKS
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  OPTIONS="lock unlock status"
  NETWORKS="$(nmcli -m multiline con list | grep '^\(NAME\|TYPE\):' | \
    grep -B1 '802-11-wireless' | grep '^NAME:' | \
    cut -d':' -f2 | sed -e s/^\ *//g)"
  case ${#COMP_WORDS[@]} in
    2) COMPREPLY=($(compgen -W "${OPTIONS}" -- ${CUR})) ;;
    3) COMPREPLY=($(compgen -W "${NETWORKS}" -- ${CUR})) ;;
  esac
}
complete -F _bssid bssid



_cryptmount () {
  local CUR PREV OPTIONS
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  OPTIONS="open close backup status"
  if [ ${#COMP_WORDS[@]} == 2 ]; then
    COMPREPLY=($(compgen -W "${OPTIONS}" -- ${CUR}))
  fi
}
complete -F _cryptmount armistice ragnar



_cifs () {
  local CUR PREV OPTIONS PROFILES MOUNTED
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  OPTIONS="mount umount list"
  PROFILES="$('ls' $HOME/.cifs 2> /dev/null)"
  MOUNTED="$('ls' /mnt/cifs 2> /dev/null)"
  UNMOUNTED=$PROFILES
  [ ! -z $MOUNTED ] && UNMOUNTED="$(echo "$PROFILES" | grep -v "$MOUNTED")"

  case ${#COMP_WORDS[@]} in
    2) COMPREPLY=($(compgen -W "$OPTIONS" -- ${CUR})) ;;
    3)
      case "${COMP_WORDS[1]}" in
        (mount)  COMPREPLY=($(compgen -W "$UNMOUNTED" -- ${CUR})) ;;
        (umount) COMPREPLY=($(compgen -W "$MOUNTED" -- ${CUR})) ;;
        (list)   COMPREPLY=($(compgen -W "$PROFILES" -- ${CUR})) ;;
      esac ;;
    4) COMPREPLY=($(compgen -W "$(cifs list ${COMP_WORDS[2]})" -- ${CUR})) ;;
  esac
}
# complete -F _cifs cifs



_daemons() {
  local CUR PREV OPTIONS ALL RUNNING STOPPED
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  OPTIONS="list help restart start stop"
  ALL="$('ls' /etc/rc.d 2> /dev/null | egrep -v '(^functions(\.d)?$)|^vmware\.d$')"
  RUNNING="$('ls' /run/daemons 2> /dev/null)"
  STOPPED="$(echo "$ALL" | grep -v "$RUNNING")"

  case ${#COMP_WORDS[@]} in
    2) COMPREPLY=($(compgen -W "$OPTIONS" -- ${CUR})) ;;
    *)
      case "${COMP_WORDS[1]}" in
        (restart | stop) COMPREPLY=($(compgen -W "$RUNNING" -- ${CUR})) ;;
        (start) COMPREPLY=($(compgen -W "$STOPPED" -- ${CUR})) ;;
        (list)  COMPREPLY=($(compgen -W "$ALL" -- ${CUR})) ;;
      esac ;;
  esac
}
complete -F _daemons rc.d



_rdp () {
  local CUR PREV PROFILES
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  PROFILES="$('ls' $HOME/.rdp 2> /dev/null)"
  [ ${#COMP_WORDS[@]} -lt 3 ] && COMPREPLY=($(compgen -W "$PROFILES" -- ${CUR}))
}
complete -F _rdp rdp



_screens() {
  local CUR PREV SCREENDIR SCREENS
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  SCREENDIR=/tmp/screens/S-$(whoami)
  [ -d "${SCREENDIR}" ] || return
  SCREENS="$('ls' $SCREENDIR 2> /dev/null | cut -d'.' -f1)"

  [[ "${PREV}" == -* ]] && COMPREPLY=($(compgen -W "$SCREENS" -- ${CUR}))
}
complete -F _screens screen



_ssh_hosts() {
  local CUR PREV HOSTS
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  HOSTS="$(cat ~/.ssh/config | egrep '^Host\s[^\*]' | sed -r 's/^Host\s*/\ /g' | tr -d '\n')"

  [ "${COMP_WORDS[0]}" != "ssh" ] && HOSTS="$(echo $HOSTS | sed 's/\>/:/g')"
  COMPREPLY=($(compgen -W "$HOSTS" -- ${CUR}))
}
complete -F _ssh_hosts ssh
complete -f -F _ssh_hosts scp sshfs rsync


_loaded_modules() {
  local CUR PREV MODULES
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  MODULES="$('ls' /sys/module)"
  COMPREPLY=($(compgen -W "$MODULES" -- ${CUR}))
}
complete -F _loaded_modules modparam


_package_man() {
  local CUR PREV OP
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  OP="${COMP_WORDS[1]}"
  case ${OP} in
    (-U* | -Qo*) COMPREPLY=($(compgen -f -- ${CUR})) ;;
    (-Q* | -R*)  COMPREPLY=($(compgen -W "$(/usr/bin/pacman -Qqs)" -- ${CUR})) ;;
    (-S*)        COMPREPLY=($(compgen -W "$(/usr/bin/pacman -Ssq; /usr/bin/pacman -Qmq)" -- ${CUR})) ;;
  esac
}
complete -o filenames -F _package_man pacman pacman-color packer

_packages() {
  local CUR PREV
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"  
  COMPREPLY=($(compgen -W "$(/usr/bin/pacman -Ssq; /usr/bin/pacman -Qmq)" -- ${CUR}))
}

complete -F _packages pkgsource

complete -cf kill killall man pidof sudo time which optirun

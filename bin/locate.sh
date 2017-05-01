#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

magichome_gateway_tmpdir() {
  cd $DIR/..
  mkdir -p tmp
  cd tmp

  pwd
}

magichome_gateway_pidfile() {
  echo "$(magichome_gateway_tmpdir)/magichome_gateway.pid"
}

magichome_gateway_locate() {
  pidfile=$(magichome_gateway_pidfile)
  if [[ -e "$pidfile" ]] && [[ $(ps -p $(cat "$pidfile") -o 'pid=' | wc -l) -gt 0 ]]; then
    cat "$pidfile"
  fi
}

magichome_gateway_logdir() {
  cd $DIR/..
  [ -e log ] || mkdir -p log
  cd log

  pwd
}

#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/locate.sh
cd $DIR/..

bundle install

exec bundle exec ruby magichome_gateway.rb -p 2001 -o HAL-1.local #>>$(magichome_gateway_logdir)/magichome_gateway.log

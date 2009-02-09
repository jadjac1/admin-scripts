#!/bin/sh

echo $@
echo $*
echo "$@"
echo "$*"

echo
echo "\$#           = $#"                # count
echo "\${!#}        = ${!#}"             # last
echo -n "args \$@      = "; args $@
echo -n "args \$*      = "; args $*
echo -n "args \"\$@\"     = "; args "$@"
echo -n "args \"\$*\"     = "; args "$*"
a=$@
echo "\$@           = $a"                # all
a=$*
echo "\$*           = $a"                # all
a="$@"
echo "\"\$@\"         = $a"              # all
a="$*"
echo "\"\$*\"         = $a"              # all

echo
echo "\${1:-def}    = ${1:-def}"         # first or 'def'
echo "\${1:+set}    = ${1:+set}"         # first ? 'set' : ''
echo
echo "\${none:=one} = ${none:=one}"      # 'one'
echo "\${none}      = ${none}"           # 'one'
echo
echo "\${#1}        = ${#1}"             # len(first)
echo
echo "\${1#*/}      = ${1#*/}"           # first - remove shortest ^.*/
echo "\${1##*/}     = ${1##*/}"          # first - remove longest  ^.*/
echo "\${1%/*}      = ${1%/*}"           # first - remove shortest /.*$
echo "\${1%%/*}     = ${1%%/*}"          # first - remove longest  /.*$
echo
echo "\${1:?error}  = ${1:?error}"       # first or exit with 'error'
echo
echo shift
shift
echo "\$#           = $#"                # count
echo "\${!#}        = ${!#}"             # last
echo "\$@           = $@"                # all
echo "\$*           = $*"                # all

echo
args=
for arg in "$@"; do echo -n "\"$arg\" "; args="$args \"$arg\""; done; echo
#while [ -n "$1" ]; do echo -n "\"$1\" "; args="$args \"$1\""; shift; done; echo
echo $args
#args=${args:1}
export args
#echo "su -c \"echo \$args\" $USER":
#su -c "echo \$args" $USER
echo

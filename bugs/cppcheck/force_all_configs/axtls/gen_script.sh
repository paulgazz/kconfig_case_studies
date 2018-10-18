set -x

srcdir=$1
preprocessdir=$2
cppflags=$3

cd $srcdir
echo "date"
echo "cat /dev/null > $srcdir/config/config.h"
find axtlswrap/ bindings/ crypto/ httpd/ samples/ ssl/ -name "*.c" | while read i; do
  echo "echo processing $i"
  cd $preprocessdir
  cli_file=`find  | grep $(basename $i).cli | head -n1`
  echo "echo cli_file $cli_file"
  echo cd $srcdir
  echo cd $(dirname $i)
  if [[ ! -z $cli_file ]]; then
      echo cppcheck $cppflags $(cat $cli_file) $(basename $i)
  else
      echo cppcheck $cppflags $(basename $i)
  fi
done
echo "date"

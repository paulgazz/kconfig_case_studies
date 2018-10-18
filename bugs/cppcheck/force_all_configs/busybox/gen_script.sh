set -x

srcdir=$1
preprocessdir=$2
cppflags=$3

cd $srcdir
echo "date"
find -name "*.c" | while read i; do
  echo "echo processing $i"
  cli_file=`find "$preprocessdir" | grep $i.cli | head -n1`
  echo "echo cli_file $cli_file"
  echo cd $srcdir
  if [[ ! -z $cli_file ]]; then
      # use cli flags, removing any macro defs
      echo cppcheck $cppflags $(cat $cli_file | sed -r 's/-[UD] ?[^ ]+//g' | sed 's/ -include include\/autoconf.h//') $i
  else
      echo cppcheck $cppflags $i
  fi
done
echo "date"

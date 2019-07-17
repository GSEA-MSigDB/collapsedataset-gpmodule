# Copyright (c) 2003-2019 Broad Institute, Inc., Massachusetts Institute of Technology, and Regents of the University of California.  All rights reserved.
#!/bin/sh
execDir=`dirname $0`

base1=`basename $1`
base2=`basename $2`
diffDir1=`mktemp -d $base1.XXXXXX`
diffDir2=`mktemp -d $base2.XXXXXX`

cut -f 1 $1 > $diffDir1/${base1}_g
cut -f 3- $1 > $diffDir1/${base1}_num
cut -f 1 $1 > $diffDir2/${base2}_g
cut -f 3- $1 > $diffDir2/${base2}_num

diff -i --strip-trailing-cr -q $diffDir1/${base1}_g $diffDir2/${base2}_g
status=$?
diff -i --strip-trailing-cr -q $diffDir1/${base1}_num $diffDir2/${base2}_num
status=$(( $? + status ))

rm -rf $diffDir1 $diffDir2
exit $status

# Copyright (c) 2003-2017 Broad Institute, Inc., Massachusetts Institute of Technology, and Regents of the University of California.  All rights reserved.
#!/bin/sh

sed "s//:/g" <$1 |diff --strip-trailing-cr - $2
exit $?

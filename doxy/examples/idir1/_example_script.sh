#!/usr/bin/bash

## 
# ## _example_script {#sh__example_script}
# Does a great job (in `bash`).
# 
#      ~~~sh
#      bash _example_script <data> <a> <b> [-d <d>] [-e <e>]  [-f <f>]
#      ~~~
# 
# ### Arguments
# * `data` : some beautiful data file that contains a nice table
# 
#  var1 | var2 | var3 
# -----:|:----:|----:
# 1     |  yes | 0
# 0     |  no  | 1
# * `a` : first input parameter;
# * `b` : second input parameter;
# * `-d <d>` : (_option_) some parameter; default: `d` is not used;
# * `-e <e>` : (_option_) numeric parameter; default: `e=1`;
# * `-f <f>` : (_option_) boolean parameter; default: `f=0`.
#
# ### Returns
# `c` : output string parameter.
# 
# ### Example
# See if any, for instance:
#
# ~~~sh
# > source("_example_function.R")
# > data <- c(1,2)
# > `_example_function`(data,3,2,d="aaa",f=TRUE)
# ~~~
#
# ### Note
# Visit the [address](http://www.some_macro.html) that certainly does not exist.
#
# ### See also
# [_example_method](@ref py_example_method), [_example_function](@ref r_example_function), 
# [_example_macro](@ref sas_example_macro).
##

data=$1
a=$2
b=$3

! [ -f $data ] && exit 1
[ -z $d ] && d=$a

c=`bc &b / &e`
[ $f ] && c=`bc $a + $c`
c="$d$c"

echo c

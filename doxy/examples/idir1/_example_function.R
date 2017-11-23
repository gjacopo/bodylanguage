## 
# ## _example_function {#r__example_function}
# Does a great job (in `R`).
# 
#      ~~~r
#      >  c <- _example_function(data, a, b, d=, e=1, f=lib);
#      ~~~
# 
# ### Arguments
# * `data` : some beautiful data that looks like a nice table
# 
#  var1 | var2 | var3 
# -----:|:----:|----:
# 1     |  yes | 0
# 0     |  no  | 1
# * `a` : first input parameter;
# * `b` : second input parameter;
# * `d` : (_option_) some parameter; default: `d` is not used;
# * `e` : (_option_) numeric parameter; default: `e=1`;
# * `f` : (_option_) boolean parameter; default: `f=FALSE`.
#
# ### Returns
# `c` : output string parameter.
# 
# ### Example
# See if any, for instance:
#
# ~~~r
# > source("_example_function.R")
# > data <- c(1,2)
# > `_example_function`(data,3,2,d="aaa",f=TRUE)
# ~~~
#
# ### Note
# Visit the [address](http://www.some_macro.html) that certainly does not exist.
#
# ### See also
# [_example_method](@ref py_example_method), [_example_script](@ref sh_example_script), 
# [_example_macro](@ref sas_example_macro).
##

'_example_function' <- function(data, a, b, d=NA, e=1, f=FALSE) {
	if (is.null(data))
		stop()
	if (is.na(d))
		d=a
	c <- b / e
	if (f)
		c <- a + c
	
	c <- paste(d, toString(c), sep="")
	
	return (c)
}

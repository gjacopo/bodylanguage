#!/bin/bash

##
# sas2store.sh {#sh_sas2store}
# Create a "store-able" version of a SAS source file
##

# @date:     15/11/2017
# @credit:   grazzja <mailto:jacopo.grazzini@ec.europa.eu>

SASEXT=sas

PROGRAM=`basename $0`
TODAY=`date +'%y%m%d'` # `date +%Y-%m-%d`

BASHVERS=${BASH_VERSION%.*}

hash find 2>/dev/null || { echo >&2 " !!! Command FIND required but not installed - Aborting !!! "; exit 1; }
hash awk 2>/dev/null || { echo >&2 " !!! Command AWK required but not installed - Aborting !!! "; exit 1; }
hash sed 2>/dev/null ||  { echo >&2 " !!! Command SED required but not installed - Aborting !!! "; exit 1; }

case "$(uname -s)" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MSYS*)      MACHINE=Msys;;
    MINGW*)     MACHINE=MinGw;;
    Windows*)   MACHINE=Windows;;
    SunOS*)     MACHINE=SunOS;;
    *)          MACHINE="UNKNOWN:${OSTYPE}"
esac

function usage() { 
    ! [ -z "$1" ] && echo "$1";
	echo "";
}

function help() {
	! [ -z "$1" ] && echo "$1";
	echo "";
}

function  greaterorequal (){
	# arguments: 	1:numeric 2:numeric
	# returns:	 	0 when argument $1 >= $2
	#				1 otherwise
	# note: 0 is the normal bash "success" return value (to be used in a "if...then" test)
	return `awk -vv1="$1" -vv2="$2" 'BEGIN { print (v1 >= v2) ? 0 : 1 }'`
}

function uppercase () {
	# argument: 	1:string
	# returns: 		a uppercase version of $1
	if `greaterorequal ${BASHVERS} 4`; then
		echo ${1^^} # does not work on bash version < 4
	else
		echo  $( tr '[:lower:]' '[:upper:]' <<< $1)
	fi
}
function lowercase () {
	# argument: 	1:string
	# returns: 		a lowercase version of $1
	if `greaterorequal ${BASHVERS} 4`; then
		echo ${1,,} # does not work on bash version < 4
	else
		echo  $( tr '[:upper:]' '[:lower:]' <<< $1)
	fi
}


dirname=
fname=
#progname=
verb=0
test=0
remdoc=0

[ $# -eq 0 ] && usage
# [ $# -eq 1 ] && [ $1 = "--help" ] && help

# options are: [-d <dir>] [-f <fname>] [-h] [-v] [-t]
while getopts :d:f:htv OPTION; do
    # extract options and their arguments into variables.
    case ${OPTION} in
	d)  dirname=${OPTARG}
            # check the existence of the directory
	    [ -d "${dirname}" ] || usage "!!! Output directory ODIR=${dirname} not found - Exiting !!!"
 	    ;;
	f)  fname=${OPTARG}
	    ;;
	h)  help #show help
	    ;;
	#r)  remdoc=1
	#    ;;
	t)  test=1
	    ;;
	v)  verb=1
	    ;;
	\?) #unrecognized option - show help
	    usage "!!! option ${OPTARG} not allowed - Exiting !!!"
	    ;;
    esac
done

shift $((OPTIND-1))  

# force REMDOC to 1...
remdoc=1

[ $# -lt 1 ] && usage "!!! Missing input PROGNAME argument - Exiting !!!"
progname=("$@")
nprogs=${#progname[@]}

echo progname=${progname[@]}
echo nprogs=$nprogs

for (( i=0; i<${nprogs}; i++ )); do
    ! [ -e "${progname[$i]}" ]                                                  \
	&& usage "!!! Input file/directory ${progname[$i]} does not exist - Exiting !!!"
done

if [ ${test} -eq 1 ]; then
    ECHOSTART=("echo" "  ... run: \"") 
    ECHOEND=("\"") 
	PIPECREATE=
	PIPEAPPEND=
    [ -z "${dirname}" ] && dirname=/tmp   
    [ -z "${fname}" ] && fname=`date +%Y%m%d-%H%M%S`
else
    [ -z "${dirname}" ] && dirname=`dirname ${progname[0]}`
	ECHOSTART=
	ECHOEND=
	PIPECREATE=">"
	PIPEAPPEND=">>"
fi

[ -n "${fname}" ] && [ ${nprogs} -eq 1 ]                    \
    && fname=${fname%.*} #`basename ${fname} .${SASEXT}`
[ -n "${fname}" ] && [ ${fname} != _* ]                     \
    && ([ ${nprogs} -gt 1 ] || [ -d "${progname[0]}" ])     \
    && fname=_${fname}

TMP=test.sas
fname=test
echo dirname=$dirname


function remcomms () {
    # remove comments
    if true; then
        # source: https://gist.github.com/mystix/426760
	a="`echo | tr '\012' '\001'`"
      	b="`echo | tr '\012' '\002'`"
       	sed '
       	    # if no start comment then go to end of script
            /\/\*/!b
       	    :a
	    s:/\*:'"$a"':g
	    s:\*/:'"$b"':g
   	    # if no end comment
	    /'"$b"'/!{
	        :b
		# if not last line then read in next one
	   	$!{
	     	    N
		    ba
		}
		# if last line then remove from start
		# comment to end of line
		# then go to end of script
	        s:'"$a[^$b]"'*$::
		bc
	    }
	    # remove comments
            '"s:$a[^$b]*$b"'::g
	    /'"$a"'/ bb
	    :c
	    s:'"$a"':/*:g
	    s:'"$b"':*/:g
	' $1
    else 
        # source: https://www.gnu.org/software/gawk/manual/html_node/Plain-Getline.html#Plain-Getline
	# some issue found with this approach
	awk 
	    '{if ((i = index($0, "/*")) != 0) {
	        out = substr($0, 1, i - 1)  
		# leading part of the string
	       	rest = substr($0, i + 2)    
	       	# ... */ ...
	       	j = index(rest, "*/")       
	       	# is */ in trailing part?
	       	if (j > 0) {
	            rest = substr(rest, j + 2) 
      		    # remove comment
       		} else {
       		    while (j == 0) {
	       		# get more text
       			if (getline <= 0) {
		       	    print("unexpected EOF or error:", ERRNO) > "/dev/stderr"
	      		    exit
	      	       	}
		       	# build up the line using string concatenation
		       	rest = rest $0
		       	j = index(rest, "*/")   
		       	# is */ in trailing part?
		       	if (j != 0) {
		       	    rest = substr(rest, j + 2)
		       	    break
		       	}
	       	    }
	        }
	       	# build up the output line using string concatenation
       		$0 = out rest
       	    }
       	    print $0}
        ' $1
    fi
}

	
function rememptylines () {
	# suppress repeated empty output lines

	sed ' 
		# space/tabs in your "empty" line
		/^\s*$/d
		' $1
	# sed 'N;/^\n$/D;P;D;' $1
}

function insstore () {
	# instore the "\store" keyword after main macro declarations

	awk '
		# note the presence of the blank after the keyword %macro
		/%macro /{m+=1} 
			# m>0
			{if (/;/ && m==1 && f==0) { 
				i = index($0,";");
				print substr($0, 0, i-1) " \\store " substr($0, i);
				f=1
				} else { 
				print $0
				}
			}
		# ibid, note the presence of the blank after the keyword %mend
		/%mend /{m-=1} 
			{if (m==0) {f=0};
				}
		' $1
}

	
for (( i=0; i<${nprogs}; i++ )); do
	echo progname? ${progname[$i]}
	for file in `find ${progname[$i]} -type f`; do
		echo f=$file
		f=`basename "$file"`		# get the extension
        ext=`lowercase ${f##*.}`
		echo ext=$ext
		echo name ${f%.*}${fname}.${SASEXT} 
		! [ "$ext" = "${SASEXT}" ] && continue
		if [ ${test} -eq 1 ]; then
			filename=
			TMP=
		else
			[ ${nprogs} -eq 1 -a ! -d ${progname[0]} ]                               \
				&& filename=${f%.*}${fname}.${SASEXT}                                \
				|| filename=${fname}.${SASEXT} 
		fi

	if [ ${remdoc} -eq 1 ]; then
		${ECHOSTART[@]} `remcomms ${file} | rememptylines - | insstore - > $filename`	
		${ECHOEND[@]}
	else	
		${ECHOSTART[@]} `insstore - > $filename`	
		${ECHOEND[@]}
	fi
		#	awk 'NF==0&&m==0&&c==0{NR=0}NR==1&&$1=="%macro"{m+=1}m==1{print $0}$NF==";"{s=2}' $TMP > $filename
		
    done
done

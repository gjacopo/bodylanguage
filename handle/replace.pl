#!/usr/bin/perl 

##
# replace.pl {#pl_replace}
# Automatic string replacement.
#
# 	~~~pl
#   replace.pl <filename> <key1> <key2>
# 	~~~~
#
# ### Arguments
# * `<filename>` : input filename, with complete path;
# * `<key1>` : input key/pattern to replace;
# * `<key2>` : otuput replacement key/pattern.
#
# ### Returns
# Replace occurences of `key1` by `key2` in the file `filename`.
#
# ### Notes
# 1. Use quotes `"` for composed strings.
# 2. Some DOS-related issue when running this command
# In order to deal with embedded control-M's in the file (source of the issue), it
# may be necessary to run `dos2unix`.
##

# @date:     15/06/2015
# @credit:     <mailto:jacopo.grazzini@ec.europa.eu>

$infile= @ARGV[0];		# file to be modified
$key1= @ARGV[1];		# keyword to be replaced
$key2= @ARGV[2];		# replacement keyword

if ($#ARGV < 0) {
    print STDOUT "Usage: replace.pl filename key1 key2 \n\t replaces occurences of key1 by key2 in the file filename\n";
} else {
    open(IN,$infile) || die "Cannot find file $infile: $!\n"; 
    while(<IN>) {
	s/$key1/$key2/og;
	$Result .= sprintf("%s", $_);
    }
    close(IN);
    
    open(OUT,">$infile");
    print OUT $Result;
    close(OUT);
}



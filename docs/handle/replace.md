## `replace.pl`
Automatic string replacement.

~~~pl
replace.pl <filename> <key1> <key2>
~~~~

### Arguments
* `<filename>` : input filename, with complete path;
* `<key1>` : input key/pattern to replace;
* `<key2>` : otuput replacement key/pattern.

### Returns
Replace occurences of `key1` by `key2` in the file `filename`.

### Notes
1. Use quotes `"` for composed strings.
2. Some DOS-related issue when running this command. In order to deal 
with embedded control-M's in the file (source of the issue), it may be 
necessary to run `dos2unix`.

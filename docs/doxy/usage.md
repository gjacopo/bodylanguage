##### `doxy@ESTAT` usage

First, document your source code file(s) according to the [guidelines](guidelines.md). Given such source file(s), you can then run the script [`src2mddoc.sh`](https://github.com/gjacopo/bodylanguage/blob/master/doxy/src2mddoc.sh) with the following syntax:

	~~~
	src2mddoc.sh [-h] [-v] [-t] [-p] [-f <fname>] [-d <dir>] <filename>
	~~~
	
where the parameters are:
* `<input>`    :   input defined as either the filename storing the source code, or the directory containing this(ese) file(s);
* `-f <name>`  :   (_option_) output name; it is either the name of the output file (with or without extension) when the parameter `<input>` (see above) is passed as a file, or a generic suffix to be added to the  output filenames otherwise; when a suffix is passed, the `_` symbol is added prior to the suffix; by default, an empty suffix (_i.e._ no suffix) is used;
* `-d <dir>`  :   (_option_) output directory for storing the output formatted files; in the case of test mode (see option `-t` below), this is overwritten by the temporary directory `/tmp/`; default: when not passed, `<dir>` is set to the same location as the input(s);
* `-h`         :   (_option_) setting this option will display the help;
* `-v`         :   (_option_) setting this option will set the verbose mode (all kind of useless comments);
* ` -t`         :   (_option_) test mode; a temporary output will be generated and displayed;
                 use it for checking purpose prior to the automatic generation.

so as to extract the documentation header(s) from the source file(s) and create one or several `markdown` formatted files containing the documentation alone. This(ese) file(s) can then be used to generate the online/browsable documentation. 
In a last stage, you can easily <a name="htmldoc"></a>[generate the documentation](generate_documentation).

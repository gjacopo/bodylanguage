## `sas2store.sh`

Atuomatic generation of a "store-able" version of a `SAS` source file.

~~~bash
   sas2store.sh [-h] [-v] [-t] [-d] [-f <fname>] [-d <dir>] <filename>
~~~

### Arguments
* `<input>` : input defined as either a filename storing some (`R`/`SAS`/`Stata`/`Python`/…)
 	source code, or a directory containing such files; all first-level (_i.e._, non 
 	nested) macros in this(ese) file(s) will be transformed into store-able macros 
 	thanks to the adding of the `'\store'` keword;
* `-f <name>` : output name; it is either the name of the output file (with or without
	`.sas` extension) when the parameter `<input>` (see above) is passed as a single file,
 	or a generic suffix to be added to the output filenames otherwise; when a suffix 
 	is passed, the `_` symbol is added prior to the suffix; when considered as a suffix,
 	the special flag `_NONE_` can be used to force `<name>` to blank (_i.e._ no suffix will 
 	be used); default: the suffix `store` is used;
* `-d <dir>` : output directory for storing the output formatted files; in the case of 
 	test mode (see option `-t` below), this is overwritten by the temporary directory 
 	`/tmp/`; default: when not passed, `<dir>` is set to the same location as the input(s);
* `-c` : flag used to add a comment (description) to the store macro;
* `-h` : display this help;
* `-v` : verbose mode (all kind of useless comments…);
* `-t` : test mode; a temporary output will be generated and displayed; use it for 
	checking purpose prior to the automatic generation.

### Examples
Run the script with the dedicated test file [
`sas2store_testfile.sas`](https://github.com/gjacopo/bodylanguage/blob/master/handle/tests/sas2store_testfile.sh), 
_e.g._ in test mode `-t`:

~~~
   sas2store.sh -t -c -f stored sas2store_testfile.sas
~~~
so as to display the generated output file in the terminal. You will notice in particular the following cases:
* the original macro:
~~~
%macro sas2store_testfile(dumb, dumber);
        %put &dumb &dumber;
%mend sas2store_testfile;
~~~
is transformed into: 
~~~
%macro sas2store_testfile(dumb, dumber) \store des="File to be used for testing of the script `sas2store.sh`.
This is another dummy line for description.";
        %put &dumb &dumber;
%mend sas2store_testfile;
~~~
since it has the same name as the input file; the name is taken from the documentation header;
* the original macro:
~~~
%macro sas2store_testfile3(dumb, dumber=);
        %macro nested_weird(thedumb);
                %macro super_nested_weird(thedumb);
                        %put &thedumb;
                %mend;
                %super_nested_weird(&thedumb);
        %mend;

        %nested_weird(&dumb);
        %nested_weird(&dumber);
%mend;
~~~
is transformed into: 
~~~
%macro sas2store_testfile3(dumb, dumber=) \store;
        %macro nested_weird(thedumb);
                %macro super_nested_weird(thedumb);
                        %put &thedumb;
                %mend;
                %super_nested_weird(&thedumb);
        %mend;

        %nested_weird(&dumb);
        %nested_weird(&dumber);
%mend;
~~~
since only "level-one" macros should be store-able while nested macros should not be modified;
* the original macro:
~~~
%macro _example_sas2store_testfile6a (dumb, dumber=) \store;
        %macro_weird(&dumb, &dumber);
        %mend_weird(&dumb, &dumber)

        %put &dumb &dumber;
%mend _example_sas2store_testfile6a;
~~~
is left unchanged since it is already stored.

Furthermore, the script also deals with different "formats" of implementation.


### Note
The output store-able file(s) must be different from the input source files, _i.e._
the input file(s) cannot be overwritten. Therefore, you need to ensure that `<dir>`
and `<name>` are not left 'blank' (empty) simultaneously; the operation will otherwise
be cancelled.

### Reference
[Saving macros using the stored compiled macro facility](http://support.sas.com/documentation/cdl/en/mcrolref/61885/HTML/default/viewer.htm#a001328775.htm).

#### `doxy@ESTAT` -- Guidelines and tools for generic code documentation (`R`/`SAS`/`Stata`).

**About**

We provide hereby a set of common guidelines and templates for a generic inline source code documentation (using `markdown` language) as well a  `bash` script for the automatic generation of a derived online documentation (using `Doxygen` generator). 

This material aims at **supporting the development, sharing and reuse of open IT components**, _e.g._, deployed in production environment, and **ensuring complete transparency of in-house computational resources**, _e.g._ regardless of the platform used for the implementation ([Grazzini and Pantisano, 2015; Grazzini and Lamarche, 2017](#References)). 

**<a name="Description"></a>Description**

An appropriate documentation will enable:
* **users** to efficiently run and (re)use a program/code,
* **developers** to maintain, share, extend, and migrate a program.

Say it otherwise, it should address the needs of all different _produsers'_ profiles. 
For that reason, it should be made available not only as an **inline documentation** (visible by those who actually implement the code, _e.g._ through comments in the code), but as a **portable document** (visible by those who run the code, _e.g._ through a browsable interface like html) as well.
To do so, we suggest to adopt a common way for describing and documenting source code/programs regardless of the platform (language, software) used for the implementation. The solution we propose in practice is the following:
* **an "inline" documentation is systematically inserted in the header** (_e.g._, top of the program file storing a macro, a function, _etc_...),
* **this documentation appears as comments** inside the programs (_e.g._, in between `/*` and `*/` marks for many languages),
* **human-readable language [_markdown_](https://daringfireball.net/projects/markdown/) is adopted** for writing the source code documentation,
* **documentation generator [_Doxygen_](http://www.stack.nl/~dimitri/doxygen/) is used** to generate a user-friendly browsable "online" documentation.

The rationale behind these choices are explained [**here**](rationale.md).

Moreover, rather than describing IT tools, the purpose of the documentation is to **describe the underlying statistical processes**. Therefore, it is important that the documentation does not restrict to a single programming language or software, but instead supports various different implementations.
In this aspect, we hereby provide with the common guidelines and templates to inline document:
* `SAS`, `R`, `Stata` and `Python` programs/functions,
* `bash` and `DOS` scripts.

as well as the tools and commands to automatically [extract the inline documentation and generate an online document](htmldoc) that merges the different documentations. The approach (_i.e._, guidelines and tools) can easily be extended to support other software/programing languages. 

**<a name="Guidelines"></a>Guidelines**

_Generic rules_

We adopt a common template for documentation, with the following rules:
* A level-2 header (with the `'##` mark) is inserted in the first line of the documentation with the name of the program (function/macro/script/...).
* A reference built as the string concatenating a prefix (usually defined as the name of the programing language) with the program name itself, is added to the program name in the header, _i.e._:

	~~~
	## <program_name> {#<language>_<program_name>}
	~~~
_e.g._,  the first line of the documentation the `SAS` macro  `quantile.sas` will look like this: `## quantile {#sas_quantile}`.
* A short description of the program is inserted below the header.
* The syntax of the program is also added to the documentation.
* The argument(s) of the program is (are) listed under the level-3 header `### Arguments`, _i.e._:

	~~~
	### Arguments
	* `input1` : main input argument;
	* `input2` : (_option_) second optional argument, with default value;
	~~~
* The output(s) of the program is (are) listed under the header `### Returns`, _i.e._:

	~~~
	### Returns
	* `output1` : first output argument;
	* `output2` : second output argument;
	~~~
* All example(s) appear after the header `### Example` (or `### Examples`).
* Indented code blocks can be inserted but fenced code blocks are preferred; they are defined using the syntax established in markdown, using 3 hyphens or tilde concatenated with the language shortname, _i.e._:

	~~~
	  ~~~<language>
	  <code_block>
	  ~~~
	~~~
_e.g._,  for `SAS` macros, `---sas` or  `~~~sas` is used; the actual list of lexers that can be used is available under the [`Pygments` page](http://pygments.org/docs/lexers/#lexer-for-sas).
* Note(s)/remark(s) appear(s) after the header `### Note` (`### Notes`).
* Reference(s) related to the programs/macros is (are) listed under `### Reference` (`### References`).
* All programs that are related to the one currently documented can be referred to after the header `### See also` using the reference defined earlier, _i.e._:

	~~~
	### See also
	[<program_name>](@ref <language>_<program_name>).
	~~~

_`SAS` programs_

As mentioned above, the documentation of SAS programs is inserted in the header of the program as a comment. More precisely, we impose that:
*. **the documentation (markdown language) shall be inserted in between the symbols: `/**` and `*/`**.

Further, we also require that:
*. **the core program (SAS code) shall be inserted in between the following anchor marks: `/** \cond */`
and `/** \endcond */`**.

_`R` programs_

Similarly, the documentation shall be inserted in the header of the program as a comment, hence
after the `#` symbol. In practice, **you will further need to insert the desired documentation in-between 
two anchors: `#cond` and `#endcond`** so as to recognise the text as specific to the documentation (and
differentiate from other comments). 

The common template for code documentation is exactly the same as the one used for SAS, with the 
following exceptions: 
* the reference used for a program is defined as the **name of the program to which the prefix string `r_`**
is added (instead of `sas_` above),
* all examples and **code excerpts shall be preceded with the `>` symbol** (like in R console),
* indented code blocks can be inserted but fenced code blocks are also preferred; they are defined 3 hyphens 
  or tilde concatenated with `r` shortname, hence `---r` or `~~~r` (for 
  [pygmentation](http://pygments.org/docs/lexers/#pygments.lexers.r.SLexer)),

**<a name="Usage"></a>Usage**

First, document your source code file(s) according to the guidelines above. Given such source file(s), you can then run the script [`src2mddoc.sh`](https://github.com/gjacopo/bodylanguage/blob/master/doxy/src2mddoc.sh) with the following syntax:

	src2mddoc.sh [-h] [-v] [-t] [-p] [-f <fname>] [-d <dir>] <filename>
	
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

**<a name="Example"></a>Example**

Some actual use of the script and implementation how-to's:
* <a name="SASdoc"></a>[`PING` documentation](example_ping) whose generated documentation can be found [here](https://gjacopo.github.io/PING/).

<table>
<tr>
<td align="centre"><kbd><img src="example_ping.png" alt="example PING quantile" width="700"  align="centre"> </kbd></td>
</tr>
<footer>
<td align="centre"><i>Statistical operations are documented regardless of the programming languages: in this example, the documentation of a quantile estimation is provided for both <code>SAS</code> and <code>R</code> implementations.</i></td>
</footer>
</table>

**<a name="Notes"></a>Notes**

The approach proposed herein is adapted to the documenting of stand-alone programs and processes.

**<a name="References"></a>References**

* Grazzini J. and Lamarche P. (2017): [**Production of social statistics... goes social!**](https://www.conference-service.com/NTTS2017/documents/agenda/data/abstracts/abstract_124.html), in _Proc.  New Techniques and Technologies for Statistics_.
* Grazzini J. and Pantisano F. (2015): [**Collaborative research-grade software for crowd-sourced data exploration: from context to practice - Part I: Guidelines for scientific evidence provision for policy support based on Big Data and open technologies**](http://publications.jrc.ec.europa.eu/repository/bitstream/JRC94504/lb-na-27094-en-n.pdf), _Publications Office of the European Union_, doi:[10.2788/329540](http://dx.doi.org/10.2788/329540).

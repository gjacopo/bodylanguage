##### `doxy@ESTAT` guidelines

<hr size="5" style="color:black;background-color:black;" />

###### <a name="Generic_rules"></a>Generic rules

We adopt a common template for documentation, with the following rules:
* A level-2 header (with the `##` mark) is inserted in the first line of the documentation with the name of the program (function/macro/script/...).
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
	* `input2` : (_option_) second optional argument, with default value.
	~~~
* The output(s) of the program is (are) listed under the header `### Returns`, _i.e._:

	~~~
	### Returns
	* `output1` : first output argument;
	* `output2` : second output argument.
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

<hr size="5" style="color:black;background-color:black;" />

###### <a name="SAS_rules"></a>`SAS` programs

The documentation of `SAS` programs is inserted as described above, in the header of the program as a comment. Further, we also require that:
* the documentation (markdown language) is inserted in between the symbols: `/**` and `*/`,
* the core program (code) is inserted in between the following anchor marks: `/** \cond */`
and `/** \endcond */`.

<hr size="5" style="color:black;background-color:black;" />

###### <a name="Stata_rules"></a>`Stata` programs

_Ibid_, the documentations of `SAS` and `Stata` programs look alike (including the use of `/**` and `*/` anchors).

<hr size="5" style="color:black;background-color:black;" />

###### <a name="R_rules"></a>`R` programs

Similarly, the documentation of `R` program follows the generic template, with the following specificities:
* the documentation is inserted in the header of the program as a comment, hence after the `#` symbol,
* two additional anchors: `#cond` and `#endcond`** need to be inserted around the documentation so as to distinguish it from other comments, 
* all examples and code excerpts shall be preceded with the `>` symbol (like in `R` console).

<hr size="5" style="color:black;background-color:black;" />

###### <a name="Python_rules"></a>`Python` programs

<hr size="5" style="color:black;background-color:black;" />

###### <a name="bash_rules"></a>`bash` scripts

<hr size="5" style="color:black;background-color:black;" />

###### <a name="DOS_rules"></a>`DOS` scripts

<hr size="5" style="color:black;background-color:black;" />

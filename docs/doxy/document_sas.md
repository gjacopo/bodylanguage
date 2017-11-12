#### doxy@ESTAT` -- Document your `SAS` programs

As mentioned above, the documentation of SAS programs is inserted in the header of the program as a comment. 
More precisely, we impose that:
* **the documentation (markdown language) shall be inserted in between the symbols: `/**` and `*/`**.

Further, we also require that:
* **the core program (SAS code) shall be inserted in between the following anchor marks: `/** \cond */`
and `/** \endcond */`**.

You will also need to adopt a common template for documentation:
* the reference used for a program/macro is defined as the **name of the program to which the prefix string `sas_`**
* arguments of a macro shall be listed under the header `### Arguments`,
* outputs shall shall be listed under the header `### Returns`,
* example(s) shall appear after the header `### Example` (`### Examples`); 
* indented code blocks can be inserted but fenced code blocks are preferred; they are defined using the syntax 
  established in markdown, using 3 hyphens or tilde concatenated with `sas` shortname, hence `---sas` or
  `~~~sas` (both, in principle, supported for [pygmentation](http://pygments.org/docs/lexers/#lexer-for-sas),
* note(s) shall appear after the header `### Note` (`### Notes`),
* reference(s) related to the programs/macros shall be listed under `### Reference` (`### References`), 
* all other related programs/macros shall appear after the header `### See also`.

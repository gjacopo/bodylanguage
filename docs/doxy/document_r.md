#### `doxy@ESTAT` -- Document your `R` programs

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
  [pygmentation](http://pygments.org/docs/lexers/#pygments.lexers.r.SLexer),

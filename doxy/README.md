doxy@ESTAT
=============

Common guidelines for a generic code documentation (`R`/`SAS`/`Stata`) and automatic tools for the generation of a browsable documentation.

---

**About**

We provide hereby a set of guidelines and templates for a generic inline source code documentation (using _markdown_ language) as well as some scripts for the automatic generation of a derived online documentation (using _Doxygen_ generator). This material aims at **supporting the development, sharing and reuse of open IT components**, _e.g._, deployed in production environment, and **ensuring complete transparency of in-house computational resources**, _e.g._ regardless of the platform used for the implementation ([Grazzini and Pantisano, 2015; Grazzini and Lamarche, 2017](#References)). 

**<a name="Description"></a>Description**

An appropriate documentation will enable:
* **users** to efficiently run and (re)use a program/code,
* **developers** to maintain, share, extend, and migrate a program.

Say it otherwise, it should address the needs of all different _produsers'_ profiles. 
For that reason, it should be made available not only as an **inline documentation** (visible by those who actually implement the code, _e.g._ through comments in the code), but as a **portable document** (visible by those who run the code, _e.g._ through a browsable interface like html) as well.
To do so, we suggest to adopt a common way for describing and documenting source code/programs regardless of the platform (language, software) used for the implementation. The solution we propose in practice is the following:
* **an "inline" documentation is systematically inserted in the header** (_e.g._, top of the program file storing a macro, a function, _etc_...),
* **the documentation appears as comments** inside the programs (_e.g._, in between `/*` and `*/` marks for many languages),
* **human-readable language [_markdown_](https://daringfireball.net/projects/markdown/) is adopted** for writing the source code documentation,
* **documentation generator [_Doxygen_](http://www.stack.nl/~dimitri/doxygen/) is used** to generate a user-friendly browsable "online" documentation.

Moreover, rather than describing IT tools, the purpose of the documentation is to **describe the underlying statistical processes**. Therefore, it is important that the documentation does not restrict to a single programming language or software, but instead supports various different implementations.
In this aspect, we hereby provide with the common guidelines and templates to inline document:
* [SAS programs](SASdoc) (_e.g._ macros),  
* [R programs](Rdoc) (_e.g._ functions), and
* [Stata programs](Statadoc) (_e.g._ functions),

as well as the tools and commands to automatically [extract the inline documentation and generate an online document](htmldoc) that merges the different documentations. The approach (_i.e._, guidelines and tools) can easily be extended to support other software/progamming languages. 

<table>
<header>
<td align="centre">Statistical operations are documented regardless of the programming languages: in this example, the documentation of a quantile estimation is provided for both <code>SAS</code> and <code>R</code> implementations.</td>
</header>
<tr>
<td align="centre"><kbd><img src="docs/examples.png" alt="examples quantile" width="700"  align="centre"> </kbd></td>
</tr>
</table>

**<a name="Usage"></a>Usage**

<a name="SASdoc"></a>_Document your `SAS` programs_

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
  `~~~sas` (both, in principle, supported for (pygmentation](http://pygments.org/docs/lexers/#lexer-for-sas),
* note(s) shall appear after the header `### Note` (`### Notes`),
* reference(s) related to the programs/macros shall be listed under `### Reference` (`### References`), 
* all other related programs/macros shall appear after the header `### See also`.

<a name="Rdoc"></a>_Document your `R` programs_

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
  (pygmentation](http://pygments.org/docs/lexers/#pygments.lexers.r.SLexer),

<a name="htmldoc"></a>_Generate the documentation_

So as to automatically generate the documentation (like this one), you will need:
* a script of extraction of the `markdown` formatted documentation from program files into pure `markdown` 
files,
* a documentation generator that creates the user-friendly browsable documentation from the `markdown` files.

As for the documentation extractor, you can use a bash script (hereby named `rsas2mddoc.sh`) specifically developed 
for this purpose. This ad-hoc program enables you to retrieve automatically the markdown formatted documentation 
inserted in R/SAS files (as described above), and store the resulting excerpts into separated files.
 
This script is located under the documentation folder `documentation\bin`. It works as an inline command:

that can be launched from any terminal so as to generate a bulk of `markdown` files (with `.md` extension) into
the `documentation\md\library` folder. The associated help looks like the following:

The resuiting `markdown` files will look exactly like the headers in your programs with the exception of the `/*` (or `/**`)
and `*/` anchors. Then, [doxygen](http://www.doxygen.org) is the tool used to actually generate the documentation.  The full 
set of guidelines/best practices for running this software is available in the 
[dedicated section](http://www.stack.nl/~dimitri/doxygen/manual/starting.html) of the doxygen website.

**<a name="Example"></a>Example**



**<a name="Objectives"></a>Rationale**
 
_Why documenting your code  (if this is not obvious already)?_
 
Beyond enabling the sharing and reuse of your code, the practical benefits of documenting it are in enabling reproducibility and verification, as well as possible extension and potential migration:
* _"A critical barrier to reproducibility in many cases is that the computer code is [not] available."_ ([Peng, 2011](#References)): computational resources should facilitate the participation of all and the integration of any additional  contribution, 
* _"Publish your code (even the small bits)"_ ([Goodman _et al._, 2014](#References)): even if there is no guarantee of quality, it can still potentially contribute to new experiments and help develop/deploy more advanced in-house analysis products,
* _"Freely provided working code - whatever its quality - improves programming and enables others to engage [with your research]"_ ([Barnes, 2010](#References)): thanks to a good documentation, any skilled person can modify the code to suit his/her needs, learn from its use and further contribute to its improvement. 

As stated in  ([Ince et al., 2011](#References)), _"with some exceptions, anything less than the release of source programs is intolerable for results that depend on computation"_. 
Ultimately, we believe that one should _"provide public access to scripts, runs, and results"_ ([Sandve _et al._, 2013](#References)), hence not only the outcomes of a given analysis, but the whole processes, data and tools necessary to produce it should be open and shared. Source code documentation overall supports these objectives. 

_Why adopting markdown for the documentation?_

[Lightweight markup languages](https://en.wikipedia.org/wiki/Lightweight_markup_language), _e.g._ [_markdown_](https://daringfireball.net/projects/markdown/), [_AsciiDoc_](http://asciidoc.org), provide formats that are both **processable by documentation generators**, and easily **readable by human produsers** (see also comparison between languages).

<table align="center">
<tr> 
    <td align="left" rowspan="2" bgcolor="#e6e6e6"><b>Language</b></td> 
    <td align="left" rowspan="2" bgcolor="#e6e6e6"><b>Supported implementations</b></td> 
    <td align="left" colspan="5" bgcolor="#e6e6e6"><b>Output formats</b></td> 
</tr> 
<tr> 
    <td align="center">XHTML</td> <td align="center">PDF</td> <td align="center">DocBook</td> <td align="center">ODF</td><td align="center">Doc</td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://asciidoc.org">AsciiDoc</a></i></td> 
    <td align="left"><code>Python</code>, <code>JavaScript</code>, <code>Ruby</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td><td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="https://daringfireball.net/projects/markdown/">markdown (and variants)</a></i></td> 
    <td align="left"><code>C</code>, <code>C#</code>, <code>Java</code>, <code>R</code>, <code>Python</code>, <code>JavaScript</code>, <code>Ruby</code>, <code>PHP</code>, <code>Perl</code>, <code>Haskell</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (HTML)</td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td><td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="https://www.mediawiki.org/wiki/MediaWiki">MediaWiki</a></i></td> 
    <td align="left"><code>PHP</code>, <code>Perl</code>, <code>Haskell</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center"><i>No</i></td> <td align="center"><i>No</i></td> <td align="center"><i>No</i></td><td align="center"><i>No</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html">reStructuredText</a></i></td> 
    <td align="left"><code>Java</code>, <code>Python</code>, <code>Haskell</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (HTML,XML)</td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td><td align="center"><i>No</i></td> 
</tr> 
</table>

For some languages, the literature may provide "consistent" examples of documentation, still they are often not generic enough and do not go beyond the inline documentation (targeting the developer, not the user).
For instance, there is, to our knowledge, no documentation framework or built-in tool that is compatible with `SAS` (a tool like [_DocItOut_](https://choonchernlim.com/docitout/) is not maintained since 2008 anymore). 

Based on the results reported in the wiki mentioned above, we preselected 4 markup languages that are: _(i)_ widely adopted opens-source, _(ii)_ enable HTML import/export (note though that Textile does not enable HTML import), and _(iii)_ are supported (possibly through different documentation generators) by more than one language.
Finally, _markdown_ language shall be adopted:
* it is human-readable, easy-to-learn,
* it is common to many languages, and in particular, in view of future migration, to `R` through its [_Rmarkdown_](http://rmarkdown.rstudio.com) variant,
* it is supported by different documentation generators (see below).

Note that it is also important that the use of a specific documentation style (possibly associated to a given generator) does not alter the natural documentation of a language (intrinsic to the language itself). In many languages (like `SAS` or `Stata`), it does not represent an issue since the documentation is inserted as comments like in `C` language.

_Why using Doxygen as the documentation generator?_

In order to create portable documentation, documentation generators can be used, Such tools - _e.g._ well-known [_javadoc_](http://www.oracle.com/technetwork/java/javase/documentation/index-jsp-135444.html) - generate software documentation from internal code comments.

<table align="center">
<tr> 
    <td align="left" rowspan="2" bgcolor="#e6e6e6"><b>Generator</b></td> 
    <td align="center" colspan="12" bgcolor="#e6e6e6"><b>Programming languages</b></td> 
    <td align="center" colspan="7" bgcolor="#e6e6e6"><b>Output types</b></td> 
</tr> 
<tr> 
    <td align="center" bgcolor="#e6e6e6"><code>C/C++</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>C#</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>Java</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>Python</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>JavaScript</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>IDL</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>PHP</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>Perl</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>Ruby</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>SQL</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>Visual Basic</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>R</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>HTML</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>XML</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>DocBook</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>man</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>RTF</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>PDF/PS</code></td> 
    <td align="center" bgcolor="#e6e6e6"><code>LaTex</code></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://docpp.sourceforge.net">Doc++</a></i></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> <td align="center"></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> <td align="center"></td> <td align="center"></td> <td align="center"></td> <td align="center"></td> <td align="center"></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> <td align="center"></td> <td align="center"></td> <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://www.stack.nl/%7Edimitri/doxygen/">Doxygen</a></i></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
    <td align="center"></td> <td align="center"></td> <td align="center"></td> 
    <td align="center"><i>Yes</i> (plugin)</td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="https://developer.apple.com/library/mac/documentation/DeveloperTools/Conceptual/HeaderDoc/intro/intro.html">HeaderDoc</a></i></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
    <td align="center"></td> <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
    <td align="center"></td> <td align="center"></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://www.naturaldocs.org">Natural Docs</a></i></td> 
    <td align="center"><i>Yes</i> (partial)</td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i> (partial)</td> <td align="center"><i>Yes</i> (partial)</td> <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i> (partial)</td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i> (partial)</td> <td align="center"><i>Yes</i> (partial)</td> <td align="center"><i>Yes</i> (partial)</td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> <td align="center"></td> <td align="center"></td> <td align="center"></td> <td align="center"></td> <td align="center"></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="https://rfsber.home.xs4all.nl/Robo/">RoBODoc</a></i></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i> (plugin)</td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://www.sphinx-doc.org/en/stable/">Sphinx</a></i></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> <td align="center"></td> <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> 
</tr> 
</table>

Based on the results reported in the previously mentioned wiki, we preselected 6 documentation generators that are: _(i)_ open source, _(ii)_ multi-platform, _i.e._ running on Windows, Linux, Unix, Mac OS X and BSD operating systems (note though that _HeaderDoc_ is not directly running on Windows), and _(iii)_ support more than one language only.
Our final choice is _Doxygen_ also because it provides [support to markdown](http://www.stack.nl/%7Edimitri/doxygen/manual/markdown.html). 

**<a name="References"></a>References**

* Grazzini J. and Lamarche P. (2017): [**Production of social statistics... goes social!**](https://www.conference-service.com/NTTS2017/documents/agenda/data/abstracts/abstract_124.html), in _Proc.  New Techniques and Technologies for Statistics_.
* Grazzini J. and Pantisano F. (2015): [**Collaborative research-grade software for crowd-sourced data exploration: from context to practice - Part I: Guidelines for scientific evidence provision for policy support based on Big Data and open technologies**](http://publications.jrc.ec.europa.eu/repository/bitstream/JRC94504/lb-na-27094-en-n.pdf), _Publications Office of the European Union_, doi:[10.2788/329540](http://dx.doi.org/10.2788/329540).
* A beginner's guide to writing documentation: http://www.writethedocs.org/guide/writing/beginners-guide-to-docs/.
* Mastering cheatsheet: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet and _markdown_ quick reference: https://en.support.wordpress.com/markdown-quick-reference/.
* Goodman A. _et al._ (2014): [**Ten simple rules for the care and feeding of scientific data**](http://www.ploscollections.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pcbi.1003542&representation=PDF). _PLoS Computational Biology_, 10(4):e1003542, doi:[10.1371/journal.pcbi.1003542](https://dx.doi.org/10.1371/journal.pcbi.1003542).
* Sandve G.K. _et al._ (2013): [**Ten simple rules for reproducible computational research**](http://www.ploscompbiol.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pcbi.1003285&representation=PDF), _PLoS Computational Biology_, 9(10):e1003285, doi:[10.1371/journal.pcbi.1003285](https://dx.doi.org/10.1371/journal.pcbi.1003285).
* Peng R.D. (2011): [**Reproducible research in computational science**](http://www.sciencemag.org/content/334/6060/1226.full.pdf), _Science_, 6060(334):1226-1227, doi:[10.1126/science.1213847](https://dx.doi.org/10.1126/science.1213847).
* Ince D.C., Hatton L., and Graham-Cumming J. (2011): [**The case for open computer programs**](http://www.nature.com/nature/journal/v482/n7386/pdf/nature10836.pdf), _Nature_, 482:485-488, doi:[10.1038/nature10836](https://dx.doi.org/10.1038/nature10836).
* Barnes N. (2010): [**Publish your computer code: it is good enough**](http://www.nature.com/news/2010/101013/pdf/467753a.pdf), _Nature_, 467:753, 2010. doi:[10.1038/467753a](https://dx.doi.org/10.1038/467753a). 
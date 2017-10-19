doxy@ESTAT
=============

Generic guidelines for software-agnostic (_R/SAS/Stata_) code documentation and automatic generation of browsable documentation.

---

**About**

We provide hereby a set of guidelines and templates for a generic inline source code documentation as well as some scripts for the automatic generation of derived online documentation. This material aims at **supporting the development, sharing and reuse of open IT components** (_e.g._, used in production environment) and **ensuring complete transparency of computational resources** that need to be deployed in-house ([Grazzini and Pantisano, 2015; Grazzini and Lamarche, 2017](#References)). In doing so, we are in line with the idea that _"with some exceptions, anything less than the release of source programs is intolerable for results that depend on computation"_ ([Ince et al., 2011](#References)). 

**<a name="Description"></a>Description**

The purpose of an appropriate documentation is to enable:
* **users** to efficiently run and (re)use a program/code,
* **developers** to maintain, share, extend, and migrate a program.
Say it otherwise, it should address the needs of all different _produsers'_ profiles

For that reason, it should be made available not only as an **inline documentation** (visible by those who actually implement the code, _e.g._ through comments in the code), but as a **portable document** (visible by those who run the code, _e.g._ through a browsable interface like html) as well.
To do so, we suggest to adopt a common way for describing and documenting source code/programs regardless of the platform (language, software) used for the implementation. The solution we propose in practice is the following:
* **an "inline" documentation is systematically inserted in the header** (_e.g._, top of the program file storing a macro, a function, _etc_...),
* **the documentation appears as comments** inside the programs (_e.g._, in between `/*` and `*/` marks for many languages),
* **human-readable language [_markdown_](https://daringfireball.net/projects/markdown/) is adopted** for writing the source code documentation,
* **documentation generator [_doxygen_](http://www.stack.nl/~dimitri/doxygen/) is used** to generate a user-friendly browsable "online" documentation.

We hereby provide with the common guidelines and templates to inline document:
* [SAS programs](SASdoc) (_e.g._ macros),  
* [R programs](Rdoc) (_e.g._ functions), and
* [Stata programs](Statadoc) (_e.g._ functions),

as well as the tools and commands to automatically [extract the inline documentation and generate an online document](htmldoc) that merges the different documentations. The approach (_i.e._, guidelines and tools) can easily be extended to support other software/progamming languages. 

**<a name="Usage"></a>Usage**

**<a name="Objectives"></a>Rationale**
 
_Why documenting your code  (if this is not obvious already)?_
 
Beyond enabling the sharing and reuse of your code, the practical benefits of documenting it are in enabling reproducibility and verification, as well as possible extension and potential migration:
* _"A critical barrier to reproducibility in many cases is that the computer code is [not] available."_ ([Peng, 2011](#References)): computational resources should facilitate the participation of all and the integration of any additional  contribution, 
* _"Publish your code (even the small bits)"_ ([Goodman _et al._, 2014](#References)): even if there is no guarantee of quality, it can still potentially contribute to new experiments and help develop/deploy more advanced in-house analysis products,
* _"Freely provided working code Ð whatever its quality Ð improves programming and enables others to engage [with your research]"_ ([Barnes, 2010](#References)): thanks to a good documentation, any skilled person can modify the code to suit his/her needs, learn from its use and further contribute to its improvement. 

Ultimately, we believe that one should _"provide public access to scripts, runs, and results"_ ([Sandve _et al._, 2013](#References)), hence not only the outcomes of a given analysis, but the whole processes, data and tools necessary to produce it should be open and shared. Source code documentation overall supports these objectives. 

_Why adopting markdown for the documentation?_

[Lightweight markup languages](https://en.wikipedia.org/wiki/Lightweight_markup_language), _e.g._ [_markdown_](https://daringfireball.net/projects/markdown/), [_AsciiDoc_](http://asciidoc.org), provide formats that are both **processable by documentation generators**, and easily **readable by human produsers** (see also comparison between languages).

For some languages, the literature may provide "consistent" examples of documentation, still they are often not generic enough and do not go beyond the inline documentation (targeting the developer, not the user).
For instance, there is, to our knowledge, no documentation framework or built-in tool that is compatible with `SAS` (a tool like [_DocItOut_](https://choonchernlim.com/docitout/) is not maintained since 2008 anymore). 

Based on the results reported in the wiki mentioned above, we preselected 4 markup languages that are: _(i)_ widely adopted opens-source, _(ii)_ enable HTML import/export (note though that Textile does not enable HTML import), and _(iii)_ are supported (possibly through different documentation generators) by more than one language.
<table align="center">
<tr> 
    <td align="left" rowspan="2">Language</td> 
    <td align="left" rowspan="2"><b>Implementations</b></td> 
    <td align="left" colspan="5">Output formats</td> 
</tr> 
<tr> 
    <td align="center">XHTML</td> <td align="center">PDF</td> <td align="center">DocBook</td> <td align="center">ODF</td><td align="center">Doc</td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://asciidoc.org">AsciiDoc</a></i></td> 
    <td align="left">Python, JavaScript, Ruby</td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td><td align="center"><i>Yes</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="https://daringfireball.net/projects/markdown/">markdown (and variants)</a></i></td> 
    <td align="left">C, C#, Java, R, Python, JavaScript, Ruby, PHP, Perl, Haskell</td> 
    <td align="center"><i>Yes</i> (HTML)</td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td><td align="center"><i>Yes</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="https://www.mediawiki.org/wiki/MediaWiki">MediaWiki</a></i></td> 
    <td align="left">PHP, Perl, Haskell</td> 
    <td align="center"><i>Yes</i></td> <td align="center"><i>No</i></td> <td align="center"><i>No</i></td> <td align="center"><i>No</i></td><td align="center"><i>No</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html">reStructuredText</a></i></td> 
    <td align="left">Java, Python, Haskell</td> 
    <td align="center"><i>Yes</i> (HTML,XML)</td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td> <td align="center"><i>Yes</i></td><td align="center"><i>No</i></td> 
</tr> 
</table>

Finally, _markdown_ language shall be adopted:
* it is human-readable, easy-to-learn,
* it is common to many languages, and in particular, in view of future migration, to `R` through its [_Rmarkdown_](http://rmarkdown.rstudio.com) variant,
* it is supported by different documentation generators (see below).

Note that it is also important that the use of a specific documentation style (possibly associated to a given generator) does not alter the natural documentation of a language (intrinsic to the language itself). In many languages (like `SAS` or `Stata`), it does not represent an issue since the documentation is inserted as comments like in `C` language.

_Why using Doxygen as the documentation generator?_

In order to create portable documentation, documentation generators can be used, Such tools - _e.g._ well-known [_javadoc_](http://www.oracle.com/technetwork/java/javase/documentation/index-jsp-135444.html) - generate software documentation from internal code comments.
Based on the results reported in the previously mentioned wiki, we preselected 6 documentation generators that are: _(i)_ open source, _(ii)_ multi-platform, _i.e._ running on Windows, Linux, Unix, Mac OS X and BSD operating systems (note though that HeaderDoc is not directly running
on Windows), and _(iii)_ support more than one language only.

<table align="center">
<tr> 
    <td align="left"></td> 
    <td align="center" colspan="12">Programming languages</td> 
    <td align="center" colspan="7">Output types</td> 
</tr> 
<tr> 
    <td align="left"></td> 
    <td align="center">C/C++</td> 
    <td align="center">C#</td> 
    <td align="center">Java</td> 
    <td align="center">Python</td> 
    <td align="center">JavaScript</td> 
    <td align="center">IDL</td> 
    <td align="center">PHP</td> 
    <td align="center">Perl</td> 
    <td align="center">Ruby</td> 
    <td align="center">SQL</td> 
    <td align="center">Visual Basic</td> 
    <td align="center">R</td> 
    <td align="center">HTML</td> 
    <td align="center">XML</td> 
    <td align="center">DocBook</td> 
    <td align="center">man</td> 
    <td align="center">RTF</td> 
    <td align="center">PDF/PS</td> 
    <td align="center">LaTex</td> 
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


Our final choice is Doxygen also because it provides [support to markdown](http://www.stack.nl/%7Edimitri/doxygen/manual/markdown.html). 

**<a name="References"></a>References**

* Grazzini J. and Lamarche P. (2017): [**Production of social statistics... goes social!**](https://www.conference-service.com/NTTS2017/documents/agenda/data/abstracts/abstract_124.html), in _Proc.  New Techniques and Technologies for Statistics_.
* Grazzini J. and Pantisano F. (2015): [**Collaborative research-grade software for crowd-sourced data exploration: from context to practice - Part I: Guidelines for scientific evidence provision for policy support based on Big Data and open technologies**](http://publications.jrc.ec.europa.eu/repository/bitstream/JRC94504/lb-na-27094-en-n.pdf), _Publications Office of the European Union_, doi:[10.2788/329540](http://dx.doi.org/10.2788/329540).
* A beginner's guide to writing documentation: http://www.writethedocs.org/guide/writing/beginners-guide-to-docs/.
* Mastering cheatsheet: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet and _markdown_ quick reference:https://en.support.wordpress.com/markdown-quick-reference/.
* Goodman A. _et al._ (2014): [**Ten simple rules for the care and feeding of scientific data**](http://www.ploscollections.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pcbi.1003542&representation=PDF). _PLoS Computational Biology_, 10(4):e1003542, . doi:[10.1371/journal.pcbi.1003542](https://dx.doi.org/10.1371/journal.pcbi.1003542).
* Sandve G.K. _et al._ (2013): [**Ten simple rules for reproducible computational research**](http://www.ploscompbiol.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pcbi. 1003285&representation=PDF), _PLoS Computational Biology_, 9(10):e1003285, doi:[10.1371/journal.pcbi.1003285](https://dx.doi.org/10.1371/journal.pcbi.1003285) .
* Peng R.D. (2011): [**Reproducible research in computational science**](http://www.sciencemag.org/content/334/6060/1226.full.pdf), _Science_, 6060(334):1226Ð1227, doi:[10.1126/science.1213847](https://dx.doi.org/10.1126/science.1213847).
* Ince D.C., Hatton L., and Graham-Cumming J. (2011): [**The case for open computer programs**](http://www.nature.com/nature/journal/v482/n7386/pdf/nature10836.pdf), _Nature_, 482:485Ð488, doi:[10.1038/nature10836](https://dx.doi.org/10.1038/nature10836).
* Barnes N. (2010): [**Publish your computer code: it is good enough**](http://www.nature.com/news/2010/101013/pdf/467753a.pdf), _Nature_, 467:753, 2010. doi:[10.1038/467753a](https://dx.doi.org/10.1038/467753a). 
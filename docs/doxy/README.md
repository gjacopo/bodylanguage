#### `doxy@ESTAT` -- Common guidelines for a generic code documentation (`R`/`SAS`/`Stata`) and automatic tools for the generation of a browsable documentation.

---

**About**

We provide hereby a set of guidelines and templates for a generic inline source code documentation (using _markdown_ language) as well as some scripts for the automatic generation of a derived online documentation (using _Doxygen_ generator). This material aims at **supporting the development, sharing and reuse of open IT components**, _e.g._, deployed in production environment, and **ensuring complete transparency of in-house computational resources**, _e.g._ regardless of the platform used for the implementation ([Grazzini and Pantisano, 2015; Grazzini and Lamarche, 2017](#References)). 

**<a name="Motivation"></a>Motivation**
 
Beyond enabling the sharing and reuse of your code, the practical benefits of documenting it are in enabling reproducibility and verification, as well as possible extension and potential migration:
* _"A critical barrier to reproducibility in many cases is that the computer code is [not] available."_ ([Peng, 2011](#References)): computational resources should facilitate the participation of all and the integration of any additional  contribution, 
* _"Publish your code (even the small bits)"_ ([Goodman _et al._, 2014](#References)): even if there is no guarantee of quality, it can still potentially contribute to new experiments and help develop/deploy more advanced in-house analysis products,
* _"Freely provided working code - whatever its quality - improves programming and enables others to engage [with your research]"_ ([Barnes, 2010](#References)): thanks to a good documentation, any skilled person can modify the code to suit his/her needs, learn from its use and further contribute to its improvement. 

As stated in  ([Ince et al., 2011](#References)), _"with some exceptions, anything less than the release of source programs is intolerable for results that depend on computation"_. 
Ultimately, we believe that one should _"provide public access to scripts, runs, and results"_ ([Sandve _et al._, 2013](#References)), hence not only the outcomes of a given analysis, but the whole processes, data and tools necessary to produce it should be open and shared. Source code documentation overall supports these objectives. 

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

The rationale behind these choices are explained [here](rationale.md).

<table>
<tr>
<td align="centre"><kbd><img src="example_ping.png" alt="example PING quantile" width="700"  align="centre"> </kbd></td>
</tr>
<footer>
<td align="centre"><i>Statistical operations are documented regardless of the programming languages: in this example, the documentation of a quantile estimation is provided for both <code>SAS</code> and <code>R</code> implementations.</i></td>
</footer>
</table>

Moreover, rather than describing IT tools, the purpose of the documentation is to **describe the underlying statistical processes**. Therefore, it is important that the documentation does not restrict to a single programming language or software, but instead supports various different implementations.
In this aspect, we hereby provide with the common guidelines and templates to inline document:
* [SAS programs](SASdoc) (_e.g._ macros),  
* [R programs](Rdoc) (_e.g._ functions), and
* [Stata programs](Statadoc) (_e.g._ functions),

as well as the tools and commands to automatically [extract the inline documentation and generate an online document](htmldoc) that merges the different documentations. The approach (_i.e._, guidelines and tools) can easily be extended to support other software/programing languages. 

**<a name="Usage"></a>Usage**

First, document your :
* <a name="SASdoc"></a>[`SAS` programs/macros](document_sas),
* <a name="Rdoc"></a>[ `R` programss/functions](document_r), and
* <a name="Statadoc"></a>[`Stata` programs/functions](document_stata), 

then you can easily <a name="htmldoc"></a>[generate the documentation](generate_documentation).

**<a name="Example"></a>Example**

Some actual use of the script and implementation how-to's:
* <a name="SASdoc"></a>[`PING` documentation](example_ping).

**<a name="Notes"></a>Notes**
The approach proposed herein is adapted to the documenting of stand-alone programs and processes.

**<a name="References"></a>References**

* Grazzini J. and Lamarche P. (2017): [**Production of social statistics... goes social!**](https://www.conference-service.com/NTTS2017/documents/agenda/data/abstracts/abstract_124.html), in _Proc.  New Techniques and Technologies for Statistics_.
* Grazzini J. and Pantisano F. (2015): [**Collaborative research-grade software for crowd-sourced data exploration: from context to practice - Part I: Guidelines for scientific evidence provision for policy support based on Big Data and open technologies**](http://publications.jrc.ec.europa.eu/repository/bitstream/JRC94504/lb-na-27094-en-n.pdf), _Publications Office of the European Union_, doi:[10.2788/329540](http://dx.doi.org/10.2788/329540).
* Goodman A. _et al._ (2014): [**Ten simple rules for the care and feeding of scientific data**](http://www.ploscollections.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pcbi.1003542&representation=PDF), _PLoS Computational Biology_, 10(4):e1003542, doi:[10.1371/journal.pcbi.1003542](https://dx.doi.org/10.1371/journal.pcbi.1003542).
* Sandve G.K. _et al._ (2013): [**Ten simple rules for reproducible computational research**](http://www.ploscompbiol.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pcbi.1003285&representation=PDF), _PLoS Computational Biology_, 9(10):e1003285, doi:[10.1371/journal.pcbi.1003285](https://dx.doi.org/10.1371/journal.pcbi.1003285).
* Peng R.D. (2011): [**Reproducible research in computational science**](http://www.sciencemag.org/content/334/6060/1226.full.pdf), _Science_, 6060(334):1226-1227, doi:[10.1126/science.1213847](https://dx.doi.org/10.1126/science.1213847).
* Ince D.C., Hatton L., and Graham-Cumming J. (2011): [**The case for open computer programs**](http://www.nature.com/nature/journal/v482/n7386/pdf/nature10836.pdf), _Nature_, 482:485-488, doi:[10.1038/nature10836](https://dx.doi.org/10.1038/nature10836).
* Barnes N. (2010): [**Publish your computer code: it is good enough**](http://www.nature.com/news/2010/101013/pdf/467753a.pdf), _Nature_, 467:753, doi:[10.1038/467753a](https://dx.doi.org/10.1038/467753a). 
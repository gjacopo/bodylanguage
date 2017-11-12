#### `doxy@ESTAT` -- Guidelines and tools for generic code documentation (`R`/`SAS`/`Stata`).

---

**About**

We provide hereby a set of common guidelines and templates for a generic inline source code documentation (using _markdown_ language) as well a  `bash` script for the automatic generation of a derived online documentation (using _Doxygen_ generator). 

This material aims at **supporting the development, sharing and reuse of open IT components**, _e.g._, deployed in production environment, and **ensuring complete transparency of in-house computational resources**, _e.g._ regardless of the platform used for the implementation ([Grazzini and Pantisano, 2015; Grazzini and Lamarche, 2017](#References)). 

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

The rationale behind these choices are explained [**here**](rationale.md).

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

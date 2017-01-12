## estatref

Layout files for `JabRef`

The purpose of the layout files stored herein is to enable a special export of bibliographical references into a searchable table using [`JabRef`](http://www.jabref.org). The files: `tablerefs-estat.layout`, `tablerefs-estat.begin.layout` and `tablerefs-estat.end.layout` haven been created following the examples in http://www.markschenk.com/tools/jabref/.

The output `html` table contains the following fields (headers):
| Link | Dataset | Project | Title | Keywords |	Source | Year | Lang. |
-----------------------------------------------------------------------

Note currently the incompatibility of the table with the loaded CSS

  <link type="text/css" rel="stylesheet" href="CROS-publication-2016_files/css_P0C19k7C3TsKm7hg3wFHvSzcEa7tBnpz4vdfXBuz5_A.css" media="all">
  
This creates issue when launching the search (table spans on 1 column only).

-	duplicated entry "Wage and Income Inequality in the European Union" (to be sure, check the DOI at the end of the publication).
-	Erroneous project title for publication "Early retirement across Europe. Does non-standard employment increase participation of older workers?" (http://ec.europa.eu/eurostat/cros/system/files/146-2014-early_retirement_across_europe_.pdf)

[CROS online page of publications](https://ec.europa.eu/eurostat/cros/content/publications-received_en).

* download the `pub-CROS` page (`.html` file and `_files` folder) and visualise it on your local, or load this [page](http://htmlpreview.github.io/?https://github.com/gjacopo/bodylanguage/blob/master/estatref/pub-CROS.html)
* download the standalone table `pub-standalone` of references in html format, or visualise the [page](http://htmlpreview.github.io/?https://github.com/gjacopo/bodylanguage/blob/master/estatref/pub-standalone.html).

## estatref

The layout files stored herein, namely: 
* `tablerefs-estat.layout`, 
* `tablerefs-estat.begin.layout`, and
* `tablerefs-estat.end.layout`

enable to export bibliographical references into a searchable table using [`JabRef`](http://www.jabref.org) bibliography reference manager. The files haven been created following the instructions and examples given in http://www.markschenk.com/tools/jabref/.

Currently, the output `html` table contains the following fields (headers):

| Link | Dataset | Project | Title | Keywords |	Source | Year | Lang. |
|------|---------|---------|-------|----------|--------|------|-------|

but this can be easily modified following again the instructions of the site above. 
When the `BibTeX` bibliography `pub.bib` (storing publications provided on the CROS online [page of microdata references](https://ec.europa.eu/eurostat/cros/content/publications-basis-eurostat-microdata_en)) is exported to HTML using this layout, the HTML table `pub-standalone` can be created. You can visualise the output at the page [`pub-html/pub-standalone.html`](http://htmlpreview.github.io/?https://github.com/gjacopo/bodylanguage/blob/master/estatref/pub-html/pub-standalone.html) and renders like the following: ![pub-image](https://github.com/gjacopo/bodylanguage/blob/master/estatref/pub-html/pub-standalone.png) 

As stated above, using that same `pub.bib` file, different arrangements of columns can be set by changing the layout file `pub.bib`. Other possible formatted outputs have been exported and stored under the `pub-export` folder (namely, `Endnote`, `BibTeXML`, `RIS`, `MySQL` and `csv`). See also the mock-up page below.

Further, the `pub-CROS` page (`.htm` file and `_files` folder) was created so as to integrate the reference table into the CROS framework and to look like that the original [page](https://ec.europa.eu/eurostat/cros/content/publications-basis-eurostat-microdata_en). You can visualise on your local, or load the page [`pub-html/pub-CROS.htm`](http://htmlpreview.github.io/?https://github.com/gjacopo/bodylanguage/blob/master/estatref/pub-html/pub-CROS.htm). Note that there is currently an incompatibility of the javascript script in the layout file with some CSS of the CROS page, namely:

   ```
   <link type="text/css" rel="stylesheet" href="CROS-publication-2016_files/css_P0C19k7C3TsKm7hg3wFHvSzcEa7tBnpz4vdfXBuz5_A.css" media="all">
   ```

since this creates issue when launching the search (table spans on 1 column only). 

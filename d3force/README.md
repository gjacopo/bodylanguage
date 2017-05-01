d3force@ESTAT
=============

Applying `d3-force` layout for exploring EU-SILC indicators
---

**About**

This page provides relevant tools used to prepare selected social indicator data downloaded from [ESTAT website](http://ec.europa.eu/eurostat/data/database) and provide an interactive based on [`d3-force` layout](https://github.com/d3/d3-force). These tools largely reuse the material developed by S.Carter for the _New York Times_ publication mentioned below [below](#References).

**Description**

The webpage [peps01_slice.html](https://github.com/gjacopo/bodylanguage/blob/master/d3force/peps01_slice.html) illustrates some important figures related to ESTAT indicator _ilc_peps01_ on *people at risk of poverty or social exclusion* by age and sex (see also the  news release [below](#References)). The front page (first tab selected) looks like this:
<table>
<tr>
<td><kbd><img src="peps01-d3force.png" alt="PEPS01 display"></kbd></td>
</tr>
</table>

**Usage** 

To see the actual interactive visualisation, you need to download the webpage and display it locally in your browser. You can get a preview of this page using `rawgit`: check this [address](https://cdn.rawgit.com/gjacopo/bodylanguage/b245c372/d3force/peps01_slice.html), though the visualisation is much slower and some of its features are disabled.

We provide hereby two `Python` modules that will enable you to prepare the selected social indicators data for the visualisation:
* `data.py` contains the classes/methods that will help you download the data from ESTAT website;
* `display.py` contains the classes/methods that will enable you to format the data to be inserted in the webpage.

Note in particular that `display.py` implements some circle packing algorithms for optimally filling a circle with other circles: this is used to position the circle centers in the initial overall display.

**<a name="References"></a>References**

* `d3` documentation: [wiki gallery](https://github.com/d3/d3/wiki/Gallery).
* S. Carter's `d3-force`-based display: [Four ways to slice Obama's 2013 budget proposal](http://www.nytimes.com/interactive/2012/02/13/us/politics/2013-budget-proposal-graphic.html), _New York Times_.
* Eurostat press release 199/2016: [The share of persons at risk of poverty or social exclusion in the EU back to its pre-crisis level](http://ec.europa.eu/eurostat/documents/2995521/7695750/3-17102016-BP-EN.pdf).
* Eurostat bubble chart: [My country in a bubble](http://ec.europa.eu/eurostat/cache/BubbleChart/).
* Algorithm for [circle packing](http://mathworld.wolfram.com/CirclePacking.html), _Wolfram_.

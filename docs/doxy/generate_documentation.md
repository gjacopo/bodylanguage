#### <a name="htmldoc"></a>Generate the documentation

So as to automatically generate the documentation (like this one), you will need:
* a script of extraction of the `markdown` formatted documentation from program files into pure _markdown_ 
files,
* a documentation generator that creates the user-friendly browsable documentation from the _markdown_ files.

As for the documentation extractor, you can use a bash script (hereby named `rsas2mddoc.sh`) specifically developed for this purpose. This ad-hoc program enables you to retrieve automatically the markdown formatted documentation 
inserted in R/SAS files (as described above), and store the resulting excerpts into separated files.
 
This script is located under the documentation folder `documentation\bin`. It works as an inline command:

that can be launched from any terminal so as to generate a bulk of `markdown` files (with `.md` extension) into the `documentation\md\library` folder. The associated help looks like the following:

The resuiting `markdown` files will look exactly like the headers in your programs with the exception of the `/*` (or `/**`) and `*/` anchors. Then, [_doxygen_](http://www.doxygen.org) is the tool used to actually generate the documentation.  The full set of guidelines/best practices for running this software is available in the 
[dedicated section](http://www.stack.nl/~dimitri/doxygen/manual/starting.html) of the doxygen website.

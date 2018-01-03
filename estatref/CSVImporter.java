/**
## csvimporter.java {#java_csvimporter}
Import simple CSV file of bibliographical references into JabRef

### Notes
1. Every field in the input CSV file must be separated by a comma.
2. This implementation follows the instructions/examples of original JabRef
documentation: http://help.jabref.org/en/CustomImports. See however the issue
related:
http://discourse.jabref.org/t/trouble-compiling-a-custom-import-filter-with-jabref-3-7/340
3. All BibTex entry types are listed in the source file: 
https://github.com/JabRef/jabref/blob/master/src/main/java/org/jabref/model/entry/BibtexEntryTypes.java
and appears as follows:

	ALL = Arrays.asList(ARTICLE, INBOOK, BOOK, BOOKLET, INCOLLECTION, CONFERENCE,
	INPROCEEDINGS, PROCEEDINGS, MANUAL, MASTERSTHESIS, PHDTHESIS, TECHREPORT, 
	UNPUBLISHED, MISC)
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jabref.logic.importer.Importer;
import org.jabref.logic.importer.ParserResult;
import org.jabref.logic.util.FileExtensions;
import org.jabref.model.entry.BibEntry;
import org.jabref.model.entry.BibtexEntryTypes;

public class CSVImporter extends Importer {

    @Override
    public String getName() {
        return "Simple CSV Importer";
    }

    @Override
    public FileExtensions getExtensions() {
        return FileExtensions.TXT;
    }

    @Override
    public String getDescription() {
        return "Imports CSV files - Every field is separated by a comma";
    }

    @Override
    public boolean isRecognizedFormat(BufferedReader reader) {
        return true; // this is discouraged except for demonstration purposes
    }

    @Override
    public ParserResult importDatabase(BufferedReader input) throws IOException {
        List<BibEntry> bibitems = new ArrayList<>();

        String line = null;
		// skip the 4 first lines
		for (int i=1;i<=4;i++) 
			line = input.readLine();
		// read...
        while (line != null) {
            if (!line.trim().isEmpty()) {
                String[] fields = line.split(",");
                BibEntry be = new BibEntry();
				if ((fields[4]).equals("Scientific journal")) {
					be.setType(BibtexEntryTypes.ARTICLE);
				} else if((fields[4]).equals("Book or chapter in book")) {
					be.setType(BibtexEntryTypes.INBOOK);
				} else if((fields[4]).equals("Public working paper")) {
					be.setType(BibtexEntryTypes.TECHREPORT);
				} else if((fields[4]).equals("Conference proceedings")) {
					be.setType(BibtexEntryTypes.INPROCEEDINGS);
				} else {
					be.setType(BibtexEntryTypes.MISC);
				}
				be.setField("project", 		fields[0]);
				// be.setField("institution", 	fields[0]);
                be.setField("dataset", 		fields[1]);
                be.setField("title", 		fields[2]);
                be.setField("howpublished", fields[4]);
                be.setField("author", 		fields[7]);
                be.setField("keywords", 	fields[8]);
                be.setField("abstract", 	fields[9]);
                be.setField("language", 	fields[10]);
                be.setField("year", 		fields[11]);
                be.setField("doi", 			fields[13]);
                be.setField("url", 			fields[14]);
                // be.setField("summary", 		fields[17]);
                bibitems.add(be);
                line = input.readLine();
            }
        }
        return new ParserResult(bibitems);
    }
}

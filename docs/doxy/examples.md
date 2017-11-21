##### `doxy@ESTAT` Examples

Some actual use of the script and implementation how-to's:
* <a name="PINGdoc"></a>[`PING` documentation](example_ping) whose generated documentation can be found 
[here](https://gjacopo.github.io/PING/).

The _markdown_ files are generated using the `src2mddoc.sh` script, _e.g._ running:

	bash src2mddoc.sh -v -p -d PING/docs/md/library/ 
		PING/library/pgm/*
		
will extract the documentation headers from all source files (whatever format) present in the input directory `PING/library/pgm` 
and store the generated `markdown` files into the output directory `PING/docs/md/library` (no suffix, programming language 
added as prefix).

Following, the script [ping2html.sh](https://github.com/gjacopo/PING/blob/master/docs/bin/ping2html.sh) script can be used 
(and further adapted) so as to generate automatically the final browsable `html` documentation, essentially running the `doxygen`
inline command as follows:

	doxygen doxygen-ping-config.cfg
	
with the `doxygen`-formatted configuration file [doxygen-ping-config.cfg](https://github.com/gjacopo/bodylanguage/blob/master/doxy/examples/doxygen-ping-config.cfg).

<table>
<tr>
<td align="centre"><kbd><img src="example_ping.png" alt="example PING quantile" width="700"  align="centre"> </kbd></td>
</tr>
<footer>
<td align="centre"><i>Statistical operations are documented regardless of the programming languages: in this example, the documentation of a quantile estimation is provided for both <code>SAS</code> and <code>R</code> implementations.</i></td>
</footer>
</table>

* <a name="dummydoc"></a>[`dummy` fake documentation](example_ping) whose generated documentation can be found 
[here](https://gjacopo.github.io/PING/).

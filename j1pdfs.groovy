#!/usr/local/bin/groovy -f

# long-ago demo of using Groovy language to parse an HTML document and extract some links.

# The web site no longer exists, but it's still a nice demo to read.

def document = new XmlParser( new org.cyberneko.html.parsers.SAXParser() ).parse("http://www28.cplan.com/cc158/sessions_catalog.jsp?ilc=158-1&ilg=english&isort=&isort_type=&is=yes&icriteria1=+&icriteria2=+&icriteria7=+&icriteria9=&icriteria8=&icriteria3=")
def links = myDocument.depthFirst().A['@href'].findAll{ it.endsWith(".pdf") }
for (l in links) println("http://www28.cplan.com" + l);


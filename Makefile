index:
	mktour mktour.dat > index.html

dist:
	git archive HEAD --output scripts.tgz --format tgz

dist:
	git archive HEAD --output scripts.tgz --format tgz

tour:
	mktour mktour.dat > tour.html

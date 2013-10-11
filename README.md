**keen importer**

A handy little utility for transferring event data between two
fine services - *Keen.io* and *Mixpanel*. Functionality is configured
via command line arguments and *config.json*, which holds API keys
and other sensitive information.

To get started, simply checkout *Importer* and build with *make*,
which will install dependencies (namely, Mixpanel's Python library).
Keen's Python library is expected to be available on the system,
such that *import keen* will work fine.


*Installation*

	sudo pip install keen
	git clone https://github.com/keenlabs/Keen-Importer.git
	cd Keen-Importer ; make
	python importer -h


*Usage*

The following example transfers events of kind "Video Play" from
*Mixpanel* to *Keen*, that were submitted between the dates
*July 1st, 2013* and *August 1th, 2013*:

	python importer 2013-07-01 2013-08-01 --from mixpanel --to keen --kind "Video Play"


*Documentation*

To make the docs, simply run *make docs*. A folder will appear
at *docs/html* with HTML documentation - simply open *index.html*
in your favorite browser to view.
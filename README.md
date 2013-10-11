**keen importer**

*Introduction*

A handy little utility for transferring event data between two
fine services - *Keen.io* and *Mixpanel*. Functionality is configured
via command line arguments and *config.json*, which holds API keys
and other sensitive information.

To get started you have a choice: build from source or install a release build.
To build from source, simply checkout *Importer* and build with *make*,
which will install dependencies (namely, Mixpanel's Python library and `pytz`).
Keen's Python library is expected to be available on the system,
such that *import keen* will work fine.

To install via *Pip*:

	pip install importer


*Configuration*

*Importer* needs a config.json, that holds your API keys for various providers,
along with settings. Here's what a `config.json` file usually looks like:

	{
	    "debug": false,
	    "verbose": true,
	    
	    "keen": {  // settings for keen! :)
	        "project_id": null,
	        "read_key": null,
	        "write_key": null
	    },
	    
	    "mixpanel": {  // settings for mixpanel
	        "api_key": null,
	        "api_secret": null,
	        "timezone": "America/Los_Angeles"
	    },
	    
	    "importer": {  // settings for the importer itself
	        "from": "mixpanel",
	        "to": "keen",
	        "kinds": []
	    }
	}


*Installation from PyPI*

	sudo pip install keen importer


*Installation from source*

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

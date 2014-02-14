#
# Importer - Makefile
#


# top-level rules
all: importer

importer: venv requirements deps
	@echo "Importer is ready! :)"
	bin/python importer -h

dev: venv devrequirements test


# dependencies
deps: lib/mixpanel requirements

lib/mixpanel:
	@echo "Downloading Mixpanel..."
	@mkdir -p importer/lib/mixpanel
	@curl --progress-bar https://mixpanel.com/site_media//api/v2/mixpanel.py > importer/lib/mixpanel/mixpanel.py

	# patch some jank
	@patch -p0 < mixpanel.patch

requirements:
	@echo "Installing dependencies..."
	@bin/pip install -r requirements.txt

# docs / tests
docs/source:
	@echo "Compiling docs..."
	@mkdir -p docs/source
	@PYTHONPATH=".:importer/:importer/lib:importer/lib/dist:$PYTHONPATH" sphinx-apidoc -o docs/source -l --full -H "Importer" -A "Sam Gammon" -V "1.0" -R "sample" -d 1 ./importer

docs: docs/source
	@echo "Building docs..."
	@mkdir -p docs/html
	@PYTHONPATH="importer/:importer/lib:importer/lib/dist:$PYTHONPATH" sphinx-build -b html docs/source docs/html


# run testsuite
test: testdeps
	@echo "Running testsuite..."
	@rm -f .coverage
	@nosetests -w importer_tests/ --with-coverage --cover-package=importer --cover-branches

testdeps:
	@echo "Building test dependencies..."
	@pip install nose -q


# environment
venv:
	@echo "Building Importer environment..."
	@virtualenv .

devrequirements:
	@echo "Installing development packages..."
	@bin/pip install -r dev_requirements.txt


# clean / distclean
clean:
	@echo "Cleaning docs/dependencies..."
	@rm -fr docs/ importer/lib/keen importer/lib/mixpanel importer/lib/dist
	
	@echo "Cleaning .pyc/.pyo files..."
	@find . -name \*.pyc -delete
	@find . -name \*.pyo -delete

	@echo "Cleaning environment..."
	@rm -fr bin/ include/ lib/ .Python

distclean: clean
	@echo "Resetting to dist..."
	@git reset --hard


1. TODO

- support keen-style ISO timestamps via CLI (instead of just Mixpanel)
- fix timestamp preservation
- make sure everything is generator-based
- refactor to allow chained, streaming down/uploads
- allow specification of a match property, keep it in a frozenset that can be dumped via cPickle
- allow file-based logging
- allow Bash-style chaining of stdout/stdin to allow chained Importer commands or something
- better mapping of providers, so that extension is possible (metaclass magic / provider enum?)
- remove timezone lambdas and replace with PYTZ dependency
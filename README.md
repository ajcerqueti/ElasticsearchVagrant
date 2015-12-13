# ElasticsearchVagrant
A quick little setup cradle for Elasticsearch to mirror AWS's ES Service for local dev.

AWS ES currently uses Elasticsearch 1.5.2, so that's what we're using. Will update as AWS does.
Bootstrap could be a bit smarter and check for ES, currently fetches every time you provision, will fix this as well as parameterise the ES version for ease in future.

Bootstrap also installs *head* to make browsing via the web browser nice and easy.

Requirements
------------
You need to have VirtualBox installed, obvs. Everything else is inside the VM. 

Installation
------------
Super simple, we just launch a VM using:

```
vagrant up
```

Once it's up and running, make sure you can reach the [ES server](http://localhost:9200)

Any issue can probably be fixed with a quick ```vagrant provision```

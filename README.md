BioPartsDB
===============

BIOPARTSDB is an open-source, modular tool for DNA synthesis workflow and parts registration, ready to be used
in most scenarios, such as molecular biology laboratories or iGem teams.

Setup your environment
---

BioPartsDB relies on Ruby (1.9.x) and MySQL (5.0.x).
We recommend to install Ruby using [rbenv] (https://github.com/sstephenson/rbenv/)
MySQL can be downloaded from [www.mysql.com] (http://www.mysql.com)

Installation
---

* Clone the BioPartsDB repository:
  `git clone https://github.com/biopartsapps/biopartsdb`

* Go to the biopartsdb directory.
  `cd biopartsdb`

* Install the gems required by BioPartsDB:
  `bundle install`

* Edit the file config/database.yml to match your MySQL configuration.

* Create the BioPartsDB database:
  `rake db:create`
  `rake db:migrate`
  
* Load BioPartsDB systems data:
  `rake db:seed`
  
* Run BioPartsDB serve: rails s puma

* Open your favorite browser and go to http://localhost:8080 to use BioPartsDB.

License
---

The source code is released under the [MIT license](https://en.wikipedia.org/wiki/MIT_License).

Cite us
---
...

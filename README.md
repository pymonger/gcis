
Global Change Information System [![Build Status](https://secure.travis-ci.org/USGCRP/gcis.png)](http://travis-ci.org/USGCRP/gcis)
================================

This is the HTML front end and API for the [Global Change Information System](http://data.globalchange.gov) (GCIS).

This portion of the GCIS is called Tuba.

Prerequisites :

    - PostgreSQL
    - Perl 5.10 or later
    - uuid-dev package
    - A recent raptor (<http://librdf.org/raptor>)

On Ubuntu 14.04, they can be installed with:

    - sudo apt-get install postgresql-contrib-9.3 libpg-hstore-perl \
      postgresql libuuid1 uuid-dev make openssl libssl-dev libpq-dev \
      graphviz libxml2 raptor2-utils curl perlbrew

Instantiate Perlbrew environment:

    perlbrew init
    perlbrew install perl-5.20.0
    perlbrew install-cpanm
    perlbrew install-patchperl
    perlbrew switch perl-5.20.0

Install of Perl prerequisites :

    cd gcis
    cpanm --installdeps .

Customize install_base :

    echo $(dirname $(dirname $(which perl)))
    vi Build.PL
    # replace install_base value of '/usr/local/gcis' with output of command above

Software installation :

    perl Build.PL
    ./Build
    ./Build test
    ./Build install

Database installation :

    sudo su - postgres -c "createuser -P -s -e $(whoami)"
    ./Build dbinstall

Configuration :

    cp eg/Tuba.conf.sample Tuba.conf
    sudo mkdir /var/local/projects
    sudo chown $(whoami):$(whoami) /var/local/projects

Starting :

    hypnotoad bin/tuba

Starting in dev mode :

    morbo -l http://0.0.0.0:3000 bin/tuba    


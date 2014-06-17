#!/usr/bin/env perl


use Mojo::UserAgent;
use Data::Dumper;
use strict;


$| = 1;


my $ua = Mojo::UserAgent->new;


my $articles = $ua->get('http://data.globalchange.gov/article.json')->res->json;

my $i = 0;
for my $article (@$articles) {
    
    last if $i > 1;
    $i++;
    print " i $i\n";

    # print Dumper $article;

    my $doi = $article->{doi};
    my $uri = $article->{uri};
    if (!$doi) {
        print " no doi for $uri\n";
        next;
    } else {
        print " doi $doi for uri $uri\n";
    }
    
    my $doi_stuff = $ua->get("http://dx.doi.org/$doi")->res;
    # print Dumper $doi_stuff;
    
    my $doi_redirect = $doi_stuff->{headers->location};
    print " doi redirect $doi_redirect\n";
}

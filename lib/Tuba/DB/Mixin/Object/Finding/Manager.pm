package Tuba::DB::Object::Finding::Manager;
# Tuba::DB::Mixin::Finding::Manager

use strict;
use warnings;

sub dbgrep {
    my $self = shift;
    my %a = @_;

    my $query_string = $a{query_string} or return;
    my $limit = $a{limit} || 10;
    my $user = $a{user};

    my @query = $self->_make_query($query_string);
    my $dbh = $self->object_class->meta->db->dbh;
    my $q = $dbh->quote('%'.$query_string.'%');
    push @query, \(qq[t2.number::text || '.' || ordinal::text like $q]);

    my @viewable;
    my @with = ( 'chapter', 'report' );
    if ($user) {
        @viewable = ( or => [ _public => 't', username => $user ] );
        push @with, 'report._report_viewers';
    } else {
        @viewable = ( _public => 't' );
    }

    my $found = $self->get_objects(
        query => [
             or => \@query,
             or => \@viewable
        ],
        with_objects => \@with,
        limit => $limit );

    return @$found;
}

1;


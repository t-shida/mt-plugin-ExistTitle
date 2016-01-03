package ExistTitle::Callbacks;

use strict;
use warnings;

use Data::Dumper;

sub _cb_entry {
    my ($cb, $app, $obj, $org_obj) = @_;

    if ( $org_obj->id ) {
        return 1;
    }

    my $iter = MT::Entry->load_iter( { class => 'entry' } );
    while ( my $iter_obj = $iter->() ) {
        if ( $iter_obj->title eq $obj->title ) {
            my $title = $obj->title;
            return $app->error( "$title is exsit." );
        }
    }

    return 1;
}

1

# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More;

BEGIN { use_ok( 'Net::Fake::Identd' ); }

my $o = Net::Fake::Identd->new ();
$o->config({ ident_user => 'testman' });
isa_ok ($o, 'Net::Fake::Identd');


# fork the proxy
my @pids;
push @pids, fork_identd($proxy);

# fork the HTTP server
my $pid = fork;
die "Unable to fork web server" if not defined $pid;
warn $pid;
warn $pid;
warn $pid;
warn $pid;
warn $pid;

if ( $pid == 0 ) {
    server_next($server) for 1 .. 2;
    exit 0;
}
push @pids, $pid;

# wait for kids
wait for @pids;

sub fork_identd {
    my $proxy = shift;
    my $sub   = shift;
                                                                                                                                                                                                                                                                                       
    my $pid = fork;
    die "Unable to fork proxy" if not defined $pid;

    if ( $pid == 0 ) {
        $0 .= " (proxy)";

        $o->run(
          port => 11300,  #run on high ports without root.
          user => 'nobody',
          group => 'nobody',
        );

        $sub->() if ( defined $sub and ref $sub eq 'CODE' );
        exit 0;
    }

    # back to the parent
    return $pid;
}




done_testing();

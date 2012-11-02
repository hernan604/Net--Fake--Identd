package Net::Fake::Identd;
use Moose;
use Net::Server;
our $VERSION=0.01;
use base qw(Net::Server);

has config => (
  is => 'rw',
  isa => 'Any',
  default => sub{
    ident_user => 'nobody',
  },
);

sub process_request {
    my ( $self ) = @_;
    while (<STDIN>) {
        warn "$_";
        my $var = $_;
        $var =~ s/\r?\n$//;
        print "$var : USERID : UNIX : " . $self->config->{ ident_user} . "\n"; # basic echo
        last if /quit/i;
    }
}

=head1 NAME

Net::Fake::Identd - Define any ident you want and start the daemon.

=head1 SYNOPSIS

  use Net::Fake::Identd;

  my $o = Net::Fake::Identd->new();
  $o->config({ ident_user => 'nobody' });

  $o->run(
    port      => 113,  #run on high ports without root.
    user      => 'nobody',
    group     => 'nobody',
    log_level => 4,
  );
  #for more options for $o->run, see:
  #http://search.cpan.org/~rhandom/Net-Server-2.006/lib/Net/Server.pod

=head1 DESCRIPTION

Use this module if you need a quick handy fake identd server.

=head1 AUTHOR

    Hernan Lopes
    CPAN ID: HERNAN
    HERNAN
    hernanlopes in gmail

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

perl(1).

=cut

#################### main pod documentation end ###################


1;
# The preceding line will help the module return a true value


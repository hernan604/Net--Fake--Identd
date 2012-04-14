

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Net::Fake::Identd',
    VERSION_FROM => 'lib/Net/Fake/Identd.pm', # finds \$VERSION
    AUTHOR       => 'Hernan Lopes (hernanlopes in gmail )',
    ABSTRACT     => 'Define any ident you want and start the daemon.',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                    },
);

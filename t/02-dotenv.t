use strict;
use warnings;
use Test::More tests => 1;

use ENV::Util;

local %ENV = ( K => 'V' );

ENV::Util::load_dotenv('t/data/test.env');

is_deeply(
    \%ENV,
    {
      K => 'V',
      FOO => 'BAR',
      BAR => 'bar with comments',
      DOT => 'env',
      SOME_KEY => '/some/value',
      QUOTED_KEY => 'this is quoted\n',
      DOUBLY => "this is doubly quoted\n"
    }, 
    '%ENV properly populated by load_dotenv'
);

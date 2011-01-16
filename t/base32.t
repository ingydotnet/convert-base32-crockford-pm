use Test::More tests => 18;

use Convert::Base32::Crockford;

ok defined &encode_base32, "encode_base32 is exported";
ok defined &decode_base32, "decode_base32 is exported";

my %encodings = (
    '28' => "\x12",
    '28T0' => "\x12\x34",
    '28T5CY0' => "\x12\x34\x56\x78",
    '28T5CY4GNF6YY' => "\x12\x34\x56\x78\x90\xab\xcd\xef",
);

for my $encoding (sort keys %encodings) {
    my $string = $encodings{$encoding};
    is encode_base32($string), $encoding, "encode is correct";
    is decode_base32($encoding), $string, "decode is correct";
    $encoding = lc($encoding);
    is decode_base32($encoding), $string, "lowercase decode is correct";
    $encoding =~ s/(..)(?=.)/$1-/g;
    is decode_base32($encoding), $string, "decode with hyphens is correct";
}

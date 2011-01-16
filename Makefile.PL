use inc::Module::Install;

all_from        'lib/Convert/Base32/Crockford.pm';

readme_from;
manifest_skip;
version_check;
ack_xxx;

requires 'Convert::Base32';

WriteAll;

#!/usr/bin/perl
use strict;
use warnings;
use utf8;

# @see https://perldoc.perl.org/Term/ANSIColor.html
use Term::ANSIColor qw(:constants);

my %setting = ();
my $reset = RESET;
my @regexList = ();

# check arguments
my $isInvalid = (@ARGV == 0) || ($ARGV[0] eq '') || (@ARGV % 2 != 0);
if ($isInvalid) {
    &printErrMsg();
    exit 1;
}

# preparation
while (my $regex = shift) {
    my $color = shift;
    my $isInvalid = ($regex eq '') || ($color eq '');
    if ($isInvalid) {
        &printErrMsg();
        exit 1;
    }
    $setting{$regex} = eval($color);
    push(@regexList, $regex);
}

# operation
while(<>) {
    foreach my $regex(@regexList) {
        my $color = $setting{$regex};
        s/($regex)/${color}${1}${reset}/g;
    }
    print;
}

##
# function for use Term::ANSIColor
#
# @param string $msg message
##
sub printMsgOnRed($) {
    my ($msg) = @_;
    print BOLD WHITE ON_RED ${msg}, RESET, "\n";
}

##
# function for output error message
##
sub printErrMsg() {
    &printMsgOnRed("Argument is incorrect. Please check again.");
    &printMsgOnRed("Usage: perl rcg.pl [regex] [color] [regex] [color] ...");
    &printMsgOnRed("e.g ) tail -f /usr/local/var/log/error.log | perl rcg.pl '.*ERR.*' 'BOLD WHITE ON_RED'");
}

exit 0;

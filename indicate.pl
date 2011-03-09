use strict;
use warnings;
use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = "0.01";
%IRSSI = (
  authors     => 'Tom Adams',
  contact     => 'tom@holizz.com',
  name        => 'indicate.pl',
  description => 'Ayatana stuff',
  license     => 'GNU General Public License version 3',
  url         => '',
);

# Indicate

sub indicate_increment {
  ...
}

sub indicate_setup {
}

sub indicate_teardown {
}

# Irssi hooks

sub indicate_print_text {
  my ($dest, $text, $stripped) = @_;
  my $server = $dest->{server};

  return if (!$server || !($dest->{level} & MSGLEVEL_HILIGHT));

  indicate_increment('print text', $dest->{target});
}

sub indicate_message_private {
  my ($server, $msg, $nick, $address) = @_;

  return if (!$server);

  indicate_increment('message private', $nick);
}

sub indicate_dcc_request {
  my ($dcc, $sendaddr) = @_;
  my $server = $dcc->{server};

  return if (!$dcc);

  indicate_increment('dcc request', $dcc->{nick});
}

sub indicate_gui_exit {
  indicate_teardown();
}

##

# Set up a new indicator in the messaging menu

indicate_setup();

# Set up the signals
Irssi::signal_add('print text', 'indicate_print_text');
Irssi::signal_add('message private', 'indicate_message_private');
Irssi::signal_add('dcc request', 'indicate_dcc_request');
Irssi::signal_add('gui exit', 'indicate_gui_exit');

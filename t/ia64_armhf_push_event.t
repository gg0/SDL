use strict;
use warnings;
use SDL;
use Test::More;
use SDL::Event;
use SDL::Events;
use SDLx::App;
use lib 't/lib';
use SDL::TestTool;

my $videodriver = $ENV{SDL_VIDEODRIVER};
$ENV{SDL_VIDEODRIVER} = 'dummy';

my $dummy = SDLx::App->new( init => SDL_INIT_VIDEO );

my $event = SDL::Event->new();

SDL::Events::push_event( $event );


my $poll_event = SDL::Event->new();

while(1) {
	SDL::Events::pump_events();

	if ( SDL::Events::poll_event($poll_event) ) {
		pass("Ran");
		last();
	} 
	else {
		warn "Running";
	}
	
}

done_testing;

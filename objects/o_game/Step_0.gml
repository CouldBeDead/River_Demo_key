// Welcome / Instructions rooms → no timers
if (room == Lose  || room == Room_menu)
{
    start_timer_running = false;
    round_timer_running = false;
    //is_spawner_active = false;
}

// 3 Second Start Timer
if (start_timer_running)
{
    var game_fps = game_get_speed(gamespeed_fps);
    start_timer_seconds -= 1 / game_fps;

    if (start_timer_seconds <= 0)
    {
        start_timer_running = false;

        // Begin round timer
        round_timer_seconds = 10;
        round_timer_running = true;

     
       // is_spawner_active   = true;


    }
}


// Round Timer
if (round_timer_running)
{

    var game_fps = game_get_speed(gamespeed_fps);
    round_timer_seconds -= 1 / game_fps;

    // End of the 60-second round
    if (round_timer_seconds <= 0)
    {
        round_timer_running = false;
       // is_spawner_active     = false;
		global.card_choice = true;
	}
}
if(!round_timer_running && !global.card_choice && !start_timer_running)
{
	round_current ++;
    
	if(round_current >= round_max)
	{
		room_goto(Lose);  // game over
	}
	else
	{
		start_timer_seconds = 3;
		start_timer_running = true;
	}

}



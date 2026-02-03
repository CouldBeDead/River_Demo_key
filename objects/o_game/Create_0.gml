/// @description 


global.mp_grid = 0;
global.drag = 0.93;
	//audio_play_sound(Dun_crawl, 0, 1, 1.0, undefined, 1.0);
persistent = true;  

// Game System
round_current = 1;
round_max = 10;

// Scores 
player_score = 0;

// Game Start Countdown

start_timer_seconds = 3;
start_timer_running = false;

// Round Timer

round_timer_seconds = 30;
round_timer_running = false;

// Set Game FPS Once
game_set_speed(60, gamespeed_fps);
global.card_choice = false;
//is_spawner_active = false;

// audio_play_sound();
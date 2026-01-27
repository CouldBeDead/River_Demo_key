/// @description 
event_inherited();
walk_spd = 2;
hp_max = 10;
hp = hp_max;

//bow
aim_dir = 0;
bow_dis = 11;
fire_rate = 30;
can_attack = true;
arrow_speed = 8;

my_bow = instance_create_layer(x, y, "Instances", o_bow);

cursor_sprite = s_cursor;
window_set_cursor(cr_none);
ready_to_restart = false;		//ensures we can restart after death animation

//Dash
dash_speed = 4;
dash_arr = []; //dash_arr
can_dash = true;
dash_cooldown = 120;
dash_timer_initial = 5;
dash_timer = dash_timer_initial; // Sets iframes
//dash arr [0] == index 0
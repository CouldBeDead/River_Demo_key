event_inherited();
hp_max = 45;
hp = hp_max;

//are we chasing the player?
alert = false;
//distance we can start chasing the player
alert_dis = 160;
attack_angle = irandom(360);
//set distance we stop from player
attack_dis = 10;

//the frame we perform our attack
attack_frame = 6;
//can we attack?
can_attack = true;
//attack delay
attack_cooldown = 35;
//how much damage we deal
damage = 5;
//how long we knockback player for
knockback_time = 15;


//create path resource
path = path_add();
//speed we chase player
move_spd = 3;
//set delay for calculating path
calc_path_timer = 30;
//set a timer for when we calc path
calc_path_delay = irandom(60);

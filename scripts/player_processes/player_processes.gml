
function reset_variables() {
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	vmove = 0;
	hmove = 0;
	dash = 0;
}

function get_input() {
	if keyboard_check(ord("A"))	left	= 1;
	if keyboard_check(ord("D"))	right	= 1;
	if keyboard_check(ord("W"))	up		= 1;
	if keyboard_check(ord("S"))	down	= 1;
	if keyboard_check_pressed(vk_space) dash = true;
	
}

function calc_movement() {
	hmove = right - left;	
	vmove = down - up;
	
	var _facing = (aim_dir < 90 or aim_dir > 270);
	if _facing == 0 _facing = -1;
	facing = _facing;
	
	if hmove != 0 or vmove != 0 {
		//get direction we are moving
		var _dir = point_direction(0, 0, hmove, vmove);
		
		//get distance we are moving
		hmove = lengthdir_x(walk_spd, _dir);
		vmove = lengthdir_y(walk_spd, _dir);
		
		//add movement to players position
		x += hmove;
		y += vmove;
	}
	
	//apply knockback movement
	x += hsp;
	y += vsp;
	
	//apply drag to knockback
	switch(state) {
		default: var _drag = 0.15;	break;
		case states.DEAD: var _drag = 0.08;	break;
	}	
	hsp = lerp(hsp, 0, _drag);
	vsp = lerp(vsp, 0, _drag);

}

function aim_bow() {
	///@desc	 gets and sets the bow aim
	
	aim_dir = point_direction(x, y, mouse_x, mouse_y);
	my_bow.image_angle = aim_dir;	
}

function collision() {
	//set target values
	var _tx = x;
	var _ty = y;
	
	//move back to last step position, out of the collision
	x = xprevious;
	y = yprevious;
	
	//get max distance we want to move
	var _disx = ceil(abs(_tx - x));
	var _disy = ceil(abs(_ty - y));
	
	//ensure we are using integers if we are colliding in the x/y axis
	if place_meeting(x + _disx * sign(_tx - x), y, o_solid) x = round(x);
	if place_meeting(x, y + _disy * sign(_ty - y), o_solid) y = round(y);
	
	//move as far as in x and y before hitting the solid
	repeat(_disx) {
		if !place_meeting(x + sign(_tx - x), y, o_solid) x += sign(_tx - x);	
	}
	repeat(_disy) {
		if !place_meeting(x, y + sign(_ty - y), o_solid) y += sign(_ty - y);
	}
	
}
function collision_i() {
	//set target values
	var _tx = x;
	var _ty = y;
	
	//move back to last step position, out of the collision
	x = xprevious;
	y = yprevious;
	
	//get max distance we want to move
	var _disx = ceil(abs(_tx - x));
	var _disy = ceil(abs(_ty - y));
	
	//ensure we are using integers if we are colliding in the x/y axis
	if place_meeting(x + _disx * sign(_tx - x), y, o_invis_wall) x = round(x);
	if place_meeting(x, y + _disy * sign(_ty - y), o_invis_wall) y = round(y);
	
	//move as far as in x and y before hitting the solid
	repeat(_disx) {
		if !place_meeting(x + sign(_tx - x), y, o_invis_wall) x += sign(_tx - x);	
	}
	repeat(_disy) {
		if !place_meeting(x, y + sign(_ty - y), o_invis_wall) y += sign(_ty - y);
	}
	
}


function anim() {
	
	switch(state) {
		default:
			if hmove != 0 or vmove != 0 {
				sprite_index = s_player_walk;
			} else {
				sprite_index = s_player_idle;	
			}
		break;
		case states.DEAD:
			sprite_index = s_player_dead;
		break;
	}

	
}


function check_fire() {
	if mouse_check_button(mb_left) {
		if can_attack {
			can_attack = false;
			alarm[0] = fire_rate;
			
			var _dir = point_direction(x, y, mouse_x, mouse_y);
			bow_dis = 5;
			var _inst = instance_create_layer(x, y, "Arrow", o_arrow);
			with(_inst) {
				speed = other.arrow_speed;	
				direction = _dir;
				image_angle = _dir;
				owner_id = other;
			}
		}
	}
	
}
function check_dash(){
	if dash and can_dash{
		state = states.DASH;
		dash_timer = dash_timer_initial
		var _dir = point_direction(0, 0, hmove, vmove);
		hsp = lengthdir_x(dash_speed, _dir);
		vsp = lengthdir_y(dash_speed, _dir);
		dash_arr = [];
	}
}



















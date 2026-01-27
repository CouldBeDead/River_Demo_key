/// @description 
damage = 5;
range = 160;
owner_id = noone;
knockback_time = 5;
audio_play_sound(Bow_Shot__Minecraft_Sound____Sound_Effect_for_editing, 0, 0, 1.0, undefined, 1.0);
function arrow_die() {
	///@desc	What happens when the arrow is destroyed
	
	speed = 0;
	instance_change(o_arrow_explode, false);

}

/*
 arrow_die is an instance function,
but I had to change it to just a normal function, as DnD does not
support instance functions at this time.  The difference is the
function is assigned as an instance variable of an object, so it's
treated like a variable of that object, and is no longer global in scope.

You could comment out the above function, and use the one below instead,
as it's really a function that is only run from within this object, so 
using an instance function makes sense.  You will also notice it turns blue
like a normal instance variable does.

arrow_die = function() {
	///@desc	What happens when the arrow is destroyed
	
	speed = 0;
	instance_change(o_arrow_explode, false);

}

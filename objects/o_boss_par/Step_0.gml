/// @description 
switch(state) {
	case states.IDLE:
		calc_entity_movement();
		check_for_player();
		if path_index != -1 state = states.MOVE;
		boss_anim();
	break;
	case states.MOVE:	
		calc_entity_movement();	
		check_for_player();
		check_facing();
		if path_index == -1 state = states.IDLE;		
		boss_anim();		
	break;
	case states.KNOCKBACK:
		calc_knockback_movement();	
		boss_anim();	
	break
	case states.ATTACK:
		calc_entity_movement();	
		perform_big_attack();
		check_facing();
		boss_anim();	
	break
	case states.DEAD:
	instance_create_layer(x,y,"Player",o_hp);
	instance_create_layer(x,y,"Player",o_key);
	instance_create_layer(x,y,"Enemy",o_boss_body);
		//instance_activate_object(o_hp);
		calc_entity_movement();	
		boss_anim();
		instance_destroy()
	break;
}
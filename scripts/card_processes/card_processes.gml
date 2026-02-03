function testCard(){
	show_debug_message("Hiiiii hi. testing. is this thing on. if it is you should be able to read this probab");	
}

function increasePlayerHealth(){
	show_debug_message("Health increased!!!");
	if(instance_exists(o_player)){
		o_player.hp_max *= 1.25;
	}
}

function increasePlayerSpeed(){
	show_debug_message("Speed increased!!!");
	if(instance_exists(o_player)){
		o_player.walk_spd *= 1.25;
	}
}

function increaseFireRate(){
	show_debug_message("Fire rate increased!!!");
	if(instance_exists(o_player)){
		o_player.fire_rate *= 1.25;
	}
}

function increaseSpawns(){
	show_debug_message("More emenys!!!");
	//filler when spawner is made.	
}

function increaseEnemyAttack(){
	show_debug_message("Stronger Monsters");
	//filler when spawner is made.	
	//my idea for the functionality is either the spawner or card system stores the increase in damage.
	//that damage is then added to the enemy whenever they spawn.
}

function decreaseTotalTime(){
	show_debug_message("Less Time");
	//filler when spawner is made.	
	//decrease the max time by an amount per round
}

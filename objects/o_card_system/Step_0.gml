//this chunk is for when a decision is triggered but there aren't any choices
//creating said choices
if(global.card_choice == true  && card1 == noone){
	card1 = instance_create_layer(32,64,"Instances",o_card);
	card2 = instance_create_layer(192,64,"Instances",o_card);
	
	card1.gui_x = 32*3;
	card1.gui_y = 64*3;
	
	card2.gui_x = 192*3;
	card2.gui_y = 64*3;
	
	//assigns a random buff and debuff to the card
	var cardBuffIndex = random_range(0,array_length(buffs));
	var cardDebuffIndex = random_range(0,array_length(debuffs));
	card1.buff = buffs[cardBuffIndex];
	card1.debuff = debuffs[cardDebuffIndex];
	
	card1.buff_text = buffsText[cardBuffIndex];
	card1.debuff_text = debuffsText[cardDebuffIndex];
	
	cardBuffIndex = random_range(0,array_length(buffs));
	cardDebuffIndex = random_range(0,array_length(debuffs));
	
	card2.buff = buffs[cardBuffIndex];
	card2.debuff = debuffs[cardDebuffIndex];
	
	card2.buff_text = buffsText[cardBuffIndex];
	card2.debuff_text = debuffsText[cardDebuffIndex];
}

//used when a choice is made but the cards are still in place
//it destroys both cards
if(global.card_choice == false && card1 != noone){
	instance_destroy(card1);
	card1 = noone
	instance_destroy(card2);
	card2 = noone
	//trigger spawner and timer to continue
}
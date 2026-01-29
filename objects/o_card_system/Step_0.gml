//this chunk is for when a decision is triggered but there aren't any choices
//creating said choices
if(card_choice == true  && card1 == noone){
	card1 = instance_create_layer(0,64,"UI",o_card);
	card2 = instance_create_layer(128,64,"UI",o_card);
	
	//assigns a random buff and debuff to the card
	card1.buff = buffs[random_range(0,array_length(buffs))];
	card1.debuff = debuffs[random_range(0,array_length(debuffs))];
	card2.buff = buffs[random_range(0,array_length(buffs))];
	card2.debuff = debuffs[random_range(0,array_length(debuffs))];
}

//used when a choice is made but the cards are still in place
//it destroys both cards
if(card_choice == false && card1 != noone){
	instance_destroy(card1);
	card1 = noone
	instance_destroy(card2);
	card2 = noone
	//trigger spawner and timer to continue
}
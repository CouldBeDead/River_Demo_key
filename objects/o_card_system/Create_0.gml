//flag set for when the player chooses cards.
card_choice = false;
card1=noone;
card2=noone;

//array of possible card effects to give
buffs = [increasePlayerHealth,increasePlayerSpeed];
debuffs = [increaseSpawns,increaseEnemyAttack];

//really ineffecient. stores the text cards display. would probably put in a json or something in the future
buffsText = ["25% More Health","25% Extra Speed"];
debuffsText = ["+X Enemy Spawns", "X% Enemy Damage"];
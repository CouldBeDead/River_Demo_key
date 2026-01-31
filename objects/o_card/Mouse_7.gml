//executes the two effects the card holds
script_execute(buff);
script_execute(debuff);

//then informs the card system a decision has been made.
o_card_system.card_choice = false;
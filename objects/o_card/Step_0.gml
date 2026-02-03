// wait for player input
if (!chosen && mouse_check_button_pressed(mb_left))
{
    if (position_meeting(mouse_x, mouse_y, id))
    {
        chosen = true;

        // execute effects ONCE
        script_execute(buff);
        script_execute(debuff);

        // inform system decision is complete
        global.card_choice = false;
    }
}

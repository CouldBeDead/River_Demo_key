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

x = camera_get_view_x(0) + gui_x;
y = camera_get_view_y(0) + gui_y;

if (mouse_check_button_released(mb_left)) {
    if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), gui_x - sprite_xoffset, gui_y - sprite_yoffset, gui_x + sprite_width, gui_y + sprite_height){
		//executes the two effects the card holds
		script_execute(buff);
		script_execute(debuff);

		//then informs the card system a decision has been made.
		global.card_choice = false;
	}
}
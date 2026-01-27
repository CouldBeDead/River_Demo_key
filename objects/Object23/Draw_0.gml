/// @description Insert description here
// You can write your code in this editor
draw_set_font(Font3);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

// Display the controls and goal text
var start_x = x  // Starting x position for the text
var start_y = y;  // Starting y position for the text
var line_height = 10;  // Line spacing for the text

// Display the control instructions
draw_text(start_x, start_y, "Kinl Controls:");
draw_text(start_x, start_y + line_height, "W, A, S, D to move");
draw_text(start_x, start_y + line_height * 2, "[SPACE] to DASH");
draw_text(start_x, start_y + line_height * 3, "RMB to shoot");

// Add some spacing and display the goal
draw_text(start_x, start_y + line_height * 5, "Goal:");
draw_text(start_x, start_y + line_height * 6, "Collect all KEYS and make it to the end of the room");

// Add spacing and display the start prompt
//draw_text(start_x, start_y + line_height * 8, "Press SHIFT to start!");

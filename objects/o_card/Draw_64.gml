draw_sprite(sprite_index,0,gui_x,gui_y);

//draws text for the cards effects.
//draw_text(gui_x,gui_y,buff_text);
//draw_text(gui_x,gui_y+32,debuff_text);

draw_text_transformed(gui_x,gui_y,buff_text,3,3,image_angle);
draw_text_transformed(gui_x,gui_y+32*3,debuff_text,3,3,image_angle);
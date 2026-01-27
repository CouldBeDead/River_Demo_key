/// @description Insert description here
// You can write your code in this editor
// Display text "Great job you Win!" and scrolling credits
  // Variables for text position and timing
 draw_set_halign(fa_center);
  draw_set_font(font_large);
		draw_text(room_width / 2, room_height /2, "You Never Escaped");

		//draw_text(room_width / 2, room_height /2 + 10, "The Dungeon");
draw_set_font(font_medium);
		draw_text(room_width / 2, room_height /2 + 30, "Press R");
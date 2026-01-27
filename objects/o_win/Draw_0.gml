/// @description Insert description here
// You can write your code in this editor
// Display text "Great job you Win!" and scrolling credits
  // Variables for text position and timing
  
  draw_set_halign(fa_center);
    if (!variable_global_exists("scroll_timer")) {
        global.scroll_timer = 0;
        global.scroll_y = room_height;
        global.display_credits = false;
    }

    // Increment timer
    global.scroll_timer += 1;

    // Draw initial win message
    if (global.scroll_timer < room_speed) { // Show for 1 second
        draw_set_font(font_large); // Set a larger font
      //  draw_text(room_width / 2, room_height / 2, "Great job you Win!");
    } else {
        global.display_credits = true;
    }

    // Scroll credits after 1 second
    if (global.display_credits) {
        // Set a medium font for credits
		draw_set_font(font_large);
		draw_text(room_width / 2, global.scroll_y, "Great job you Win!");
         draw_set_font(font_medium);
		draw_text(room_width / 2, global.scroll_y + 100, "Credits:\n\nGame Design: Nicolas Torres\nProgramming: Nicolas Torres\nArt: Nicolas Torres\nMusic: Nicolas Torres\n\nStarring:\nKnil as Knil\n\nFeaturing:\nCrunch as Crunch\nand\nMunch as Munch");
		draw_set_font(font_large);
		draw_text(room_width / 2, global.scroll_y+ 500, "Special Thanks to you:\nAllen Westcott");
        global.scroll_y -= .5; // Scroll up
    }

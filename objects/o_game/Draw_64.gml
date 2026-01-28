
// START COUNTDOWN (big)
if (start_timer_running)
{
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(display_get_gui_width()/2, display_get_gui_height()/2,
          "Get Ready to KILL! " + string(ceil(start_timer_seconds)));
}

// ROUND TIMER
if (round_timer_running)
{
    var gui_w = display_get_gui_width();

    draw_set_color(c_white);
    draw_text(gui_w/2 - 50, 32, "Time: " + string(ceil(round_timer_seconds)));

    // timer bar
    draw_set_color(c_dkgray);
    draw_rectangle(gui_w/2 - 150, 60, gui_w/2 + 150, 80, false);

    var pct = round_timer_seconds / 60;
    draw_set_color(c_lime);
    draw_rectangle(gui_w/2 - 150, 60, gui_w/2 - 150 + (300*pct), 80, false);
}


// ROUND NUMBER + SCORE
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(32, 32, "Round: " + string(round_current) + "/" + string(round_max));
draw_text(32, 80, "Player Score: " + string(player_score));

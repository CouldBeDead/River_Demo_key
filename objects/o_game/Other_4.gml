//set grid / tile size
#macro TS 32

enemy_spawn_count = 12;          // X enemies per round (change this)
enemies_spawned_this_round = false;

// persistent room grid size for later spawning
grid_w = ceil(room_width / TS);
grid_h = ceil(room_height / TS);

global.keys = 0;

//create motion planning grid
global.mp_grid = mp_grid_create(0, 0, grid_w, grid_h, TS, TS);

//tilemap id (store it so spawn function can use it later)
map_wall = layer_tilemap_get_id("Tiles_wall");


// WALL SOLIDS BUILD

for (var yy = 0; yy < grid_h; ++yy) {
    for (var xx = 0; xx < grid_w; ++xx) {
        var _t1 = tilemap_get(map_wall, xx, yy);
        if (_t1 >= 1 && _t1 <= 47) {
            instance_create_layer(xx * TS, yy * TS, "Collisions", o_solid);
        }
    }
}

mp_grid_add_instances(global.mp_grid, o_solid, true);

for (var yy = 0; yy < grid_h; ++yy) {
    for (var xx = 0; xx < grid_w; ++xx) {
        var _t1 = tilemap_get(map_wall, xx, yy);
        if (_t1 >= 1 && _t1 <= 47) {
            var _inst = collision_point(xx * TS, yy * TS, o_solid, false, true);
            if (_inst == noone) continue;

            with (_inst) {
                do {
                    var _change = false;
                    var _inst_next = instance_place(x + 1, y, o_solid);
                    if (_inst_next != noone) {
                        image_xscale++;
                        instance_destroy(_inst_next);
                        _change = true;
                    }
                } until (_change == false);

                var _inst_above = instance_place(x, y - 1, o_solid);
                if (_inst_above != noone
                && _inst_above.bbox_left == bbox_left
                && _inst_above.bbox_right == bbox_right) {
                    y = _inst_above.y;
                    image_yscale += _inst_above.image_yscale;
                    instance_destroy(_inst_above);
                }
            }
        }
    }
}


// TIMER + SPAWN SETTINGS
start_timer_seconds = 3;
start_timer_running = true;

round_timer_seconds = 60;
round_timer_running = false;

// how many enemies to spawn when round starts
enemy_spawn_count = 12;   // <-- set X here
enemies_spawned_this_round = false;


// SPAWN FUNCTION
function spawn_enemies_exact(_count)
{
    var _tries_per_enemy = 40;

    for (var i = 0; i < _count; i++)
    {
        var spawned = false;

        for (var t = 0; t < _tries_per_enemy; t++)
        {
            var tx = irandom(grid_w - 1);
            var ty = irandom(grid_h - 1);

            // must be empty tile (not wall)
            var tile_id = tilemap_get(map_wall, tx, ty);
            if (tile_id >= 1 && tile_id <= 47) continue;

            // world pos (center of tile)
            var sx = tx * TS + TS * 0.5;
            var sy = ty * TS + TS * 0.5;

            // don't spawn inside merged solids
            if (place_meeting(sx, sy, o_solid)) continue;

            // OPTIONAL: don't stack enemies on each other
            if (instance_place(sx, sy, o_enemy) != noone) continue;

            instance_create_layer(sx, sy, "Enemy", o_enemy);
            spawned = true;
            break;
        }

        // if it couldn't find a spot after tries, it just skips that one
    }
}

//set grid / tile size
//#macro TS		32

//get tiles in room
var _w = ceil(room_width / TS);
var _h = ceil(room_height / TS);
global.keys = 0
//create motion planning grid
global.mp_grid = mp_grid_create(0, 0, _w, _h, TS, TS);

//loop through every tile and add a single solid if it's a wall
var _map = layer_tilemap_get_id("Tiles_wall");
//create 1x1 solid
for (var yy = 0; yy < _h; ++yy) {
    for (var xx = 0; xx < _w; ++xx) {
	    var _t1 = tilemap_get(_map, xx, yy);
		if _t1 >= 1 and _t1 <= 47 {
			instance_create_layer(xx * TS, yy * TS, "Collisions", o_solid);
		}
	}
}

//add solid instances to grid
mp_grid_add_instances(global.mp_grid, o_solid, true);

//loop through grid positions again.  Get solid id and if a solid is to the right, absorb it.
for (var yy = 0; yy < _h; ++yy) {
    for (var xx = 0; xx < _w; ++xx) {
	    var _t1 = tilemap_get(_map, xx, yy);
		if _t1 >= 1 and _t1 <= 47 {
			//get solid id at this position(using a smaller tile size, as there is overlap)
			var _inst = collision_point(xx * TS, yy * TS, o_solid, 0, 1);
			//if no solid found, move to the next grid position
			if _inst == noone continue;
			
			//replace the solids to the right 
			with(_inst) {
				do {
					var _change = false;
					var _inst_next = instance_place(x + 1, y, o_solid);
					if _inst_next != noone {
						image_xscale++;
						instance_destroy(_inst_next);
						_change = true;
					}
				} until _change == false;	
				
				//merge with any solids above that are the same shape
				var _inst_above = instance_place(x, y - 1, o_solid);
				if _inst_above != noone and _inst_above.bbox_left == bbox_left and _inst_above.bbox_right == bbox_right {
					y = _inst_above.y;
					image_yscale += _inst_above.image_yscale;
					instance_destroy(_inst_above);
				}					
				
			}					
		}
		}
	}


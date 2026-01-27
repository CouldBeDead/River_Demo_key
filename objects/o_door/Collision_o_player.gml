
if (room == RoomS) {
	key_count = 1
    if (global.keys == key_count) {
        room_goto(Room1);
		global.keys = 0
    }
}
if (room == Room1) {
	key_count = 5
    if (global.keys == key_count) {
        room_goto(Win);
		global.keys = 0
    }
}
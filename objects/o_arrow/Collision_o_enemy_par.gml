/// @description 
knockback_time = 5;
if other.hp > 0 {
	damage_entity(other, owner_id, damage, knockback_time);
	arrow_die();
}
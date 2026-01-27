knockback_time = knockback_time || 2;
if other.hp > 0 {
	damage_entity(other, owner_id, damage, knockback_time);
	arrow_die();
}
knockback_time = 5;
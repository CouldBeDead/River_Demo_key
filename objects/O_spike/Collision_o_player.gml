// Collision Event in o_spike
other.hp -= .1; // subtract 1 health directly

if (other.hp <= 0) {
    other.state = states.DEAD;
    other.ready_to_restart = true;
    // optional: instance_destroy(other); or play death animation
}

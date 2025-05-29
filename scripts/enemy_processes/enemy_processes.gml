function calc_entity_movement() {
	x += hsp;
	y += vsp;
	
	hsp *= global.drag;
	vsp *= global.drag;
	
	
	check_if_stopped();

}

function check_if_stopped() {
	if abs(hsp) < 0.1 hsp = 0;
	if abs(vsp) < 0.1 vsp = 0;

}




}

function check_for_player(){
	var _dis = distance_to_object(obj_player);
	
	if calc_path_timer -- <=0 {
	calc_path_timer = calc_path_delay
	
	if x == xp or y == yp var _type = 0 else var _type = 1;
	var _found_payer = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, _type);
	
	if _found_payer {
	path_start(path, move_spd, path_action_stop, false);
	
	}
	}
	
}

function enemy_anim(){
	switch(state) {
	case states.idle:
	sprite_index = s_idle
	show_hurt();
	
	break;
	case states.move:
	sprite_index = s_walk;
	show_hurt();

	break;
	case states.attack():
	sprite_index = s_attack;
	
	break
	case states.dead():
	sprite_index = s_dead;
	
	break;
	}
	
	depth = -bbox_bottom;
	
	
	xp = x;
	yp = y;
	
}

function show_hurt(){
	if knockback_time-- > 0 sprite_index = s_hurt;
}
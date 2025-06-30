switch(state) {
	case states.idle:
	calc_entity_movement();
	check_for_player();
	if path_index != -1 state = states.move;
	enemy_anim();
	
	break;
	case states.move:
	calc_entity_movement();
	check_for_player();
	check_facing();
	if path_index == -1 state = states.idle;
	enemy_anim();
		
	break;
	case states.attack():
	calc_entity_movement();
	enemy_anim();
	
	break
	case states.dead():
	calc_entity_movement();
	enemy_anim();
	
	
	break;
	
}
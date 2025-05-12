function check_for_player(){
	var _dis = distance_to_object(obj_player);
	
	if calc_path_timer -- <=0 {
	calc_path_timer = calc_path_delay
	
	var _found_payer = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, choose(0, 1));
	
	if _found_payer {
	path_start(path, move_spd, path_action_stop, false);
	
	}
	}
	
}
function damage_entity(_tid, _sid, _damage, _time){
	with(_tid) {
	hp -= _damage;
	var _dead = is_dead();
	path_end();
	if _dead var _dis = 4 else var _dis = 1;
	var _dir = point_direction(_sid.x, _sid.y, x, y);
	hsp += lengthdir_x(_dis, _dir);
	vsp += lengthdir_y(_dis, _dir);
	calc_path_delay = _time;
	alert = true;
	knockback_time = _time;
	return _dead;
	}

}

function is_dead(){
	if state != states.dead {
		if hp <= 0 {
			state = states.dead;
			hp = 0;
			image_index = 0;
			switch(object_index){
				default:
				
				break;
				case obj_player:
				
				break;
			
			}
			return true;
		
		}
	return true;
	}

}

function check_facing() {
	if knockback_time <= 0 {
	var _facing = sign(x - xp);
	if _facing != 0 facing = _facing;
	}
}

function show_healthbar() {
	
	if hp != hp_max and hp > 0 {
		draw_healthbar(x-7, y-16, x+7, y-14, hp/hp_max*100, $003300, $3232FF, $00B200, 0, 1, 1);
	}
}
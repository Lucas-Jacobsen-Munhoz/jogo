function reset_variables(){
up = 0;
left = 0;
down = 0;
right = 0;
vmove = 0;
hmove = 0;

}



function get_input(){
if keyboard_check(ord("W")) up =1;
if keyboard_check(ord("A")) left =1;
if keyboard_check(ord("S")) down =1;
if keyboard_check(ord("D")) right =1;

}


function calc_movement(){
	hmove = right - left;
    vmove = down - up;

var _facing = (aim_dir < 90 or aim_dir > 270);
if _facing == 0  _facing = -1;
facing = _facing;


if hmove != 0 facing = hmove;


if hmove != 0 or vmove != 0 {
var _dir = point_direction(0, 0, hmove, vmove);


hmove = lengthdir_x(walk_spd, _dir);
vmove = lengthdir_y(walk_spd, _dir);

x += hmove;
y += vmove;

}

aim_dir = point_direction(x, y, mouse_x, mouse_y);
my_bow.image_angle = aim_dir;

}

function collision(){
var _tx = x;
var _ty = y;

x = xprevious;
y = yprevious;

var _disx = abs(_tx - x);
var _disy = abs(_ty - y);

repeat(_disx){
if !place_meeting(x + sign(_tx - x), y, obj_solid) x += sign(_tx - x);

}


repeat(_disy){
if !place_meeting(x, y + sign(_ty - y), obj_solid) y += sign(_ty - y);

}



}



function anim() {

if hmove != 0 or vmove != 0 {
sprite_index = s_player_walk;

} else {
sprite_index = s_player_idle;

}

}

function check_fire() {
    // Definir o delay entre os dois tiros em frames (ajuste conforme necessário)
    var _double_shot_delay_frames = 5; // Um pequeno delay

    // Se o player não estiver no meio de um ciclo de tiro duplo,
    // e o botão esquerdo do mouse for pressionado
    if (!is_double_shooting && mouse_check_button(mb_left)) {
        if (can_fire) {
            // Verifica se a sequência especial está ativa no inventário
            var _special_sequence_active = scr_check_special_sequence(obj_inventario); // Chame seu objeto de inventário aqui

            if (_special_sequence_active) {
                // Ativa o modo de tiro duplo
                is_double_shooting = true;
                double_shot_fired_count = 0; // Reseta o contador de tiros disparados
                double_shot_delay_timer = 0; // Reseta o timer
                can_fire = false; // Impede novos tiros normais até o ciclo duplo terminar

                // Dispara o primeiro tiro imediatamente
                _perform_single_shot(); // Chama a nova função/script para disparar um único tiro
                double_shot_fired_count++;

            } else {
                // Tiro normal (se a sequência não estiver ativa)
                _perform_single_shot(); // Chama a nova função/script para disparar um único tiro
                can_fire = false; // Ativa o cooldown normal
                alarm[0] = fire_rate;
            }
        }
    }

    // Lógica para o segundo tiro no modo de tiro duplo
    if (is_double_shooting) {
        double_shot_delay_timer++; // Incrementa o timer a cada frame

        if (double_shot_delay_timer >= _double_shot_delay_frames) {
            // Se o timer atingiu o delay e o segundo tiro ainda não foi disparado
            if (double_shot_fired_count < 2) {
                _perform_single_shot(); // Dispara o segundo tiro
                double_shot_fired_count++;
            }

            // Se ambos os tiros foram disparados, finaliza o ciclo de tiro duplo
            if (double_shot_fired_count >= 2) {
                is_double_shooting = false; // Sai do modo de tiro duplo
                can_fire = false;           // Ativa o cooldown normal para o próximo clique
                alarm[0] = fire_rate;       // Inicia o cooldown baseado na sua fire_rate normal
                double_shot_delay_timer = 0;
                double_shot_fired_count = 0;
            }
        }
    }
}
	







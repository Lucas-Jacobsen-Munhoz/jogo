event_inherited();

walk_spd = 1.5;

hp_max = 10;

hp = hp_max;


aim_dir = 0;

bow_dis = 15 ;

fire_rate = 30;

can_fire = true;

tiro_speed = 8;

// ... suas variáveis existentes ...

// ... suas variáveis existentes (can_fire, fire_rate, tiro_speed, etc.) ...

// Variáveis para o sistema de tiro duplo
is_double_shooting = false;      // Flag para indicar que estamos em um ciclo de tiro duplo
double_shot_delay_timer = 0;   // Timer para o delay entre os dois tiros
double_shot_fired_count = 0;   // Contador para saber quantos tiros foram disparados no ciclo duplo



my_bow = instance_create_layer(x, y, "instances", obj_bow);

cursor_sprite = s_cursor;

window_set_cursor(cr_none);
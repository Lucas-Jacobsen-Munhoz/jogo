/// @function scr_perform_single_shot()
/// @description Cria e configura um único projétil de tiro

function _perform_single_shot() {
    // Sua lógica de disparo atual
    var _dir = point_direction(x, y, mouse_x, mouse_y);

    var _inst = instance_create_layer(x, y, "tiro", obj_tiro);
    with (_inst) {
        speed = other.tiro_speed;
        direction = _dir;
        image_angle = _dir;
        owner_id = other;
    }
}
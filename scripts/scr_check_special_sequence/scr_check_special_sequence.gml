/// @function scr_check_special_sequence(inventory_object)
/// @param {object} inventory_object O objeto do inventário (ex: obj_inventario)
/// @returns {bool} true se a sequência especial estiver nos 4 primeiros slots, false caso contrário

function scr_check_special_sequence(rootobject) {
    // Verifica se o objeto de inventário existe e tem o array 'inventory'
    if (!instance_exists(rootobject) || !variable_instance_exists(rootobject, "inventory")) {
        return false;
    }

    // Verifica se a sequência de frames global foi definida e tem 4 elementos
    if (!variable_global_exists("special_item_sequence_frames") || array_length(global.special_item_sequence_frames) != 4) {
        show_debug_message("ERRO: global.special_item_sequence_frames não definida ou não tem 4 elementos.");
        return false;
    }

    // Loop pelos 4 primeiros slots do inventário (índices 0, 1, 2, 3)
    for (var i = 0; i < 4; i += 1) {
        // Pega o valor (índice da sub-imagem) do item no slot atual
        var _item_in_slot_frame = rootobject.inventory[i];

        // Se o slot estiver vazio (-1), a sequência não pode ser completa
        if (_item_in_slot_frame == -1) {
            return false;
        }

        // Compara o frame do item no slot com o frame esperado na sequência global
        if (_item_in_slot_frame != global.special_item_sequence_frames[i]) {
            return false; // Se um item não corresponder ao frame esperado, a sequência é inválida
        }
    }

    return true; // Se o loop terminar, todos os itens correspondem à sequência
}
// Fora de qualquer evento, no topo do obj_inventario ou em um script global:
#macro inventory_slots 15

// obj_inventario: Evento Create (AGORA CORRETO)
rowlength = 6;
inventory = array_create(inventory_slots, -1);
randomize();

is_open = false; // Começa fechado


// Definindo a sequência de frames dos itens
global.special_item_sequence_frames = [
    0, // Exemplo: frame 0 para o primeiro item da sequência
    1, // Exemplo: frame 1 para o segundo item da sequência
    2, // Exemplo: frame 2 para o terceiro item da sequência
    3  // Exemplo: frame 3 para o quarto item da sequência
];

// Agora, inicializando os 4 primeiros slots com esses itens
inventory[0] = global.special_item_sequence_frames[0];
inventory[1] = global.special_item_sequence_frames[1];
inventory[2] = global.special_item_sequence_frames[2];
inventory[3] = global.special_item_sequence_frames[3];


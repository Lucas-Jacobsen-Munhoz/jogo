// obj_inventario: Evento Step

// Verifica se a tecla TAB foi pressionada
if (keyboard_check_pressed(vk_tab)) {
    is_open = !is_open; // Inverte o estado de abertura/fechamento

    if (is_open) {
        // Pausar o jogo quando o inventário abre
        time_source_global_speed = 0; // Define a velocidade global do jogo para 0 (pausa)
    } else {
        // Retomar o jogo quando o inventário fecha
        time_source_global_speed = 1; // Retorna a velocidade global do jogo para 1 (normal)
    }
}

// ... o restante do seu código do Step para o inventário (se houver) ...
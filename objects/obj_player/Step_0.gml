// obj_player: Evento Step

// VERIFIQUE SE O INVENTÁRIO ESTÁ FECHADO ANTES DE EXECUTAR A LÓGICA DO JOGADOR
if (!obj_inventario.is_open) {
    // ESTE É O BLOCO DE CÓDIGO QUE SÓ DEVE RODAR QUANDO O JOGO NÃO ESTÁ PAUSADO
    // OU SEJA, QUANDO O INVENTÁRIO ESTÁ FECHADO.
    
    reset_variables();
    get_input();
    calc_movement(); // Inclui a movimentação do player
    collision();
    anim();
    check_fire();    // Inclui a lógica de tiro
    
    // ... qualquer outra lógica do player que deva ser pausada ...
}

// A LÓGICA DO INVENTÁRIO (NO OBJ_INVENTARIO) NÃO PRECISA ESTAR AQUI.
// Ela é tratada diretamente no obj_inventario e deve SEMPRE funcionar,
// para que você possa abrir/fechar o inventário.
if (is_open) {
    draw_sprite_stretched(
        spr_inventario,
        0,
        x-6,
        y-6,
        12+rowlength*36,
        12+(((inventory_slots-1) div rowlength)+1)*36
    );

    for (var i = 0; i < inventory_slots; i += 1;)
    {
        var xx = x +(i mod rowlength) *36 + 2;
        var yy = y +(i div rowlength) *36 + 2;
        var hover = (obj_mouse.inventoryhover == id) && (obj_mouse.slothover == i)
        draw_sprite(spr_slot,hover,xx,yy)
        if (inventory[i] != -1)
        {
            var alpha = 1.0;
            if (obj_mouse.inventorydrag == id) && (obj_mouse.slotdrag == i) alpha = 0.5;
            draw_set_alpha(alpha);
            draw_sprite(spr_itens,inventory[i],xx,yy);
            draw_set_alpha(1.0); // Resetar alpha após desenhar o item
        }
    }
}


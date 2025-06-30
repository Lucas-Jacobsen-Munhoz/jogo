inventoryhover = -1;
slothover = -1;
inventorydrag = -1;
slotdrag = -1;
itemdrag = -1;

mouseover = function()
{
	slothover = -1;
	inevntoryhove = -1;
	
	var mx = mouse_x;
	var my = mouse_y;
	
	with (obj_inventario)
	{
		if (point_in_rectangle(
		mx,
		my,
		x-6,
		y-6,
		x-6 + 12+rowlength*36,
		y-6 +12+(((inventory_slots-1) div rowlength)+1)*36)
		)
		{
			for (var i = 0; i < inventory_slots; i += 1){
			var xx = x + (i mod rowlength) * 36 +2;
			var yy = y + (i div rowlength) * 36 +2;
			if (point_in_rectangle(mx,my,xx,yy,xx+32,yy+32))
			{
				other.slothover = i;
				other.inventoryhover = id;
				
			}
		}	
		}
	}
}

statefree = function()
{
	mouseover();
	
	if (mouse_check_button(mb_left)) && (slothover != -1) && (inventoryhover.inventory[slothover] != -1)
	{
		state = statedrag;
		itemdrag = inventoryhover.inventory[slothover];
		inventorydrag = inventoryhover;
		slotdrag = slothover;
		
	}
}

statedrag = function()
{
	mouseover();
	if (!mouse_check_button(mb_left))
	{
		if (slothover != -1) inventoryswap(inventorydrag,slotdrag,inventoryhover,slothover)
		
		state = statefree;
		itemdrag = -1
		inventorydrag = -1;
		slotdrag = -1;
		
	}
}
state = statefree;

function inventorysearch(rootobject,itemtype){
	for (var i = 0; i < inventory_slots; i += 1)
	{
		if (rootobject.inventory[i] == itemtype)
		{
			return(i);
		}
	
	}
	return(-1);

}

function inventoryremove(rootobject,itemtype)
{
	var _slot = inventorysearch(rootobject,itemtype);
	if (_slot != -1)
	{
		with (rootobject) inventory[_slot] = -1;
		return true;
	}
	else return false;
}

function inventoryadd(rootobject,itemtype)
{
	var _slot = inventorysearch(rootobject,-1);
	if (_slot != -1)
	{
		with (rootobject) inventory[_slot] = itemtype;
		return true;	
	}
	else return false;

}

function inventoryswap (objectfrom,slotfrom,objectto,slotto)
{
	var _itemfrom = objectfrom.inventory[slotfrom]
	objectfrom.inventory[slotfrom] = objectto.inventory[slotto];
	objectto.inventory[slotto] = _itemfrom;
}
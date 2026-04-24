Scriptname CACO_PhysWornBandageArmorScript extends ObjectReference  
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
	Standard Poultices will heal even after removed
}
Armor Property ThisItem Auto
Armor Property DirtyBandage Auto
Potion Property AdditionalPotion Auto

Event OnUnequipped(Actor akActor)
	akActor.RemoveItem(ThisItem, 1, true)
	akActor.AddItem(DirtyBandage, 1, true)	
	;schofida - addition
	if (AdditionalPotion != none)
		akActor.AddItem(AdditionalPotion, 1, true)
		akActor.EquipItem(AdditionalPotion, false, true)
	endif
EndEvent

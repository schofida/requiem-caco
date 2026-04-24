Scriptname CACO_PhysWornBandageEffectScript extends activemagiceffect  
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
	Poultices now heal for 3 hours or until removed
	Standard Poultices will heal even after removed
}
Armor Property CleanBandage Auto
Armor Property DirtyBandage Auto
Potion Property AdditionalPotion Auto

;schofida - addition
Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForSingleUpdateGameTime(3.0)
EndEvent

;schofida - addition
Event OnUpdateGameTime()
	Dispel()
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if akTarget.IsEquipped(CleanBandage)
		akTarget.UnEquipItem(CleanBandage, false, true)
		akTarget.AddItem(DirtyBandage, 1, true)
		akTarget.EquipItem(DirtyBandage, false, true)
		akTarget.RemoveItem(CleanBandage, 1, true)
		;schofida - addition
		if (AdditionalPotion != none)
			akTarget.AddItem(AdditionalPotion, 1, true)
			akTarget.EquipItem(AdditionalPotion, false, true)
		endif
	;else
	;	akTarget.AddItem(DirtyBandage, 1, true)
	;	akTarget.RemoveItem(CleanBandage, 1, true)
	endif	
EndEvent
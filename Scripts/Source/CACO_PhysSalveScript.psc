Scriptname CACO_PhysSalveScript extends activemagiceffect  
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
						Added additional dialog to heal mount. ConsumeHealingPoulticSpell heals just like base Requiem healing poultice
}
Actor Property PlayerRef Auto
Message Property BandageMessage Auto
Message Property NoBandageMessage Auto
Potion Property Salve Auto
MiscObject Property CleanBandage Auto
MiscObject Property CreatedBandage Auto
SPELL Property ConsumeHealingPoulticSpell  Auto

int Apply

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == PlayerRef
		Apply = BandageMessage.Show()
		if Apply == 0
			if PlayerRef.GetItemCount(CleanBandage) >= 1
				PlayerRef.RemoveItem(CleanBandage, 1, true)
				PlayerRef.AddItem(CreatedBandage, 1)
			else	
				NoBandageMessage.Show()
				PlayerRef.AddItem(Salve, 1, true)
			endif
		elseif Apply == 1; schofida - change
			PlayerRef.AddSpell(ConsumeHealingPoulticSpell, false);schofida - change
		else	
			PlayerRef.AddItem(Salve, 1, true)
		endif
	endif	
EndEvent  

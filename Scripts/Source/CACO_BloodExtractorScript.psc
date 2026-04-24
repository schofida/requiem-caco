Scriptname CACO_BloodExtractorScript extends ObjectReference  
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
			The event fired but the extractor never unequips. This method works.
}

Form Property ThisItem Auto
{The item this script is attached to. Self doesn't work on items in containers.}

Event OnEquipped(Actor akActor)
	if akActor == Game.GetPlayer() && !akActor.HasPerk(CACO_BloodHarvestPerk)
		debug.notification("You lack the knowledge needed to use this item.")
		akActor.UnequipItem(ThisItem)
	endIf
endEvent

Perk Property CACO_BloodHarvestPerk Auto
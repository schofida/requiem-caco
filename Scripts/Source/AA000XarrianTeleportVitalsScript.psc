Scriptname AA000XarrianTeleportVitalsScript extends activemagiceffect  
{schofida - Original script from Requiem version 2.0 by the Requiem Team
	- Add organ taken token to prevent organ harvesting (Mad Scientist perk)
	- Depending on target's race, add new body parts from particular race
}
Ingredient Property HumansHeart Auto
Race Property dremora Auto
;schofida - new form params
Ingredient Property ElvenHeart Auto
Ingredient Property ArgonianScales Auto
Ingredient Property OrcLiver Auto
LeveledItem Property KhajiitEyes Auto
MiscObject Property OrganTakenToken Auto
Race Property AltmerRace Auto
Race Property DunmerRace Auto
Race Property BosmerRace Auto
Race Property KhajiitRace Auto
Race Property OrcRace Auto
Race Property ArgonianRace Auto

Event OnEffectStart(Actor caster, actor target)
	Caster.KillEssential(Target)
	Utility.Wait(0.5)
	
	;schofida - new condition. Check if Organ has not previously been harvested
	If Caster.IsDead() && Caster.GetRace() != dremora && Caster.GetItemCount(OrganTakenToken) < 1
		Caster.AddItem(OrganTakenToken, 1, true) ;schofida - add token to prevent further harvesting
		;Add new ingredients depending on race; fallback to human heart
		if Caster.GetRace() == KhajiitRace
			Target.AddItem(KhajiitEyes, 1)
			return
		endif
		if Caster.GetRace() == OrcRace
			Target.AddItem(OrcLiver, 1)
			return
		endif
		if Caster.GetRace() == ArgonianRace
			Target.AddItem(ArgonianScales, 1)
			return
		endif
		if Caster.GetRace() == AltmerRace || Caster.GetRace() == BosmerRace || Caster.GetRace() == DunmerRace
			Target.AddItem(ElvenHeart, 1)
			return
		endif
		Target.Additem(HumansHeart, 1)
	endif
EndEvent

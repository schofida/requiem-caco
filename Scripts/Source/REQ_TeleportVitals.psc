Scriptname REQ_TeleportVitals extends activemagiceffect  
{schofida - Original script from Requiem version 2.0 by the Requiem Team
	- Add organ taken token to prevent organ harvesting (Mad Scientist perk)
	- Depending on target's race, add new body parts from particular race
}

GlobalVariable Property EssentialNPCs Auto

Ingredient Property HumansHeart Auto

Keyword Property ActorTypeDaedra Auto
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

Event OnEffectStart(Actor akTarget, actor akCaster)
	If EssentialNPCs.GetValue()
		akTarget.Kill(akCaster)
	Else
		akTarget.KillEssential(akCaster)
	EndIf
	Utility.Wait(0.5)
	
	;schofida - new condition. Check if Organ has not previously been harvested
	If akTarget.IsDead() && !akTarget.HasKeyword(ActorTypeDaedra) && akTarget.GetItemCount(OrganTakenToken) < 1
		akTarget.AddItem(OrganTakenToken, 1, true) ;schofida - add token to prevent further harvesting
		;Add new ingredients depending on race; fallback to human heart
		if akTarget.GetRace() == KhajiitRace
			akCaster.AddItem(KhajiitEyes, 1)
			return
		endif
		if akTarget.GetRace() == OrcRace
			akCaster.AddItem(OrcLiver, 1)
			return
		endif
		if akTarget.GetRace() == ArgonianRace
			akCaster.AddItem(ArgonianScales, 1)
			return
		endif
		if akTarget.GetRace() == AltmerRace || akTarget.GetRace() == BosmerRace || akTarget.GetRace() == DunmerRace
			akCaster.AddItem(ElvenHeart, 1)
			return
		endif
		akCaster.Additem(HumansHeart, 1)
	endif
EndEvent

Scriptname CACO_FoodEffectSoberUp extends activemagiceffect  
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
						Incorporated Requiem's rules where player's health+stamina affect inebriation.
						Lowered all stage ranges making all alchohol more lethal.
						Using Requiems IMSP where only one is needed
}
Faction Property DrunkFaction Auto
Faction Property DrunkFactionMax Auto
Faction Property ToleranceFaction Auto
Faction Property ToleranceIncreasedFaction Auto
GlobalVariable Property BaseTolerance Auto
Spell Property SoberUpSpell Auto
int ToleranceAmt
int ToleranceMult
float UpdateTime
float LastUpdate
Actor TargetRef

GlobalVariable Property DrunkAnimations Auto
GlobalVariable Property DrunkVisuals Auto
GlobalVariable Property DrunkBlackout Auto
GlobalVariable Property CACO_AlcoholDrunkMessages Auto
Idle property DrunkStart  auto
Idle property DrunkStop auto
Idle property FullStop auto
Idle property StuckOut auto
imageSpaceModifier property Drunk02ISMD auto
imageSpaceModifier property Drunk03ISMD auto
imageSpaceModifier property Drunk04ISMD auto
imageSpaceModifier property Drunk05ISMD auto
imageSpaceModifier property Drunk06ISMD auto
bool ANIM
bool IMSP2
;bool IMSP3 - schofida remove
;bool IMSP4 - schofida remove
;bool IMSP5 - schofida remove
bool DisplayMSG

Event OnEffectStart(Actor akTarget, Actor akCaster)
	TargetRef = akTarget as Actor
	ToleranceMult = BaseTolerance.GetValue() as int
	ToleranceAmt = TargetRef.GetFactionRank(ToleranceFaction) as int
	if ToleranceAmt >= (ToleranceMult*5)
		UpdateTime = 0.05
	elseif ToleranceAmt >= (ToleranceMult*4)
		UpdateTime = 0.06
	elseif ToleranceAmt >= (ToleranceMult*3)
		UpdateTime = 0.07
	elseif ToleranceAmt >= (ToleranceMult*2)
		UpdateTime = 0.08
	elseif ToleranceAmt >= ToleranceMult
		UpdateTime = 0.09
	elseif ToleranceAmt < 0
		TargetRef.AddToFaction(ToleranceFaction)
		UpdateTime = 0.1
	else
		UpdateTime = 0.1
	endif
	if (akTarget == Game.GetPlayer()) && (CACO_AlcoholDrunkMessages.GetValue() == 1)
		DisplayMSG = true
	else
		DisplayMSG = false
	endif	
;disparity tolerance
	;if female updatetime = updatetime * 1.5  (or updatetime + 0.02?)
	;if argonian?  or just allow their natural 50% resist poison to work in their favor

	float ResistVal = TargetRef.GetActorValue("PoisonResist")
	if ResistVal > 80
		UpdateTime = UpdateTime - 0.025
	elseif ResistVal > 60
		UpdateTime = UpdateTime - 0.020
	elseif ResistVal > 40
		UpdateTime = UpdateTime - 0.015
	elseif ResistVal > 20
		UpdateTime = UpdateTime - 0.010
	elseif ResistVal > 0	
		UpdateTime = UpdateTime - 0.005
	endif
	
	;schofida - Requiem factors player health and stamina
	float PlayerHealth = TargetRef.GetActorValue("Health") + TargetRef.GetActorValue("Stamina")
	if PlayerHealth >= 1000
		UpdateTime = UpdateTime - 0.020
	elseif PlayerHealth >= 750
		UpdateTime = UpdateTime - 0.015
	elseif PlayerHealth >= 500
		UpdateTime = UpdateTime - 0.010
	elseif PlayerHealth >= 250
		UpdateTime = UpdateTime - 0.005
	endif

	RegisterForSingleUpdateGameTime(UpdateTime)		;updatetime =(game hours)
	LastUpdate = Utility.GetCurrentGameTime()			;5.9284 is 5 days and 22.2816 hours (.9284*24) or if you expand it out more 5 days, 22 hours, 16 minutes, and 53.76 seconds
EndEvent


Event OnUpdateGameTime()
	float Rounds = ((Utility.GetCurrentGameTime() - LastUpdate) * 24 * 60) * (0.1 / UpdateTime * 0.1) 
	LastUpdate = Utility.GetCurrentGameTime()
	if Rounds > 1
		TargetRef.ModFactionRank(DrunkFaction, -Rounds as int)
	else	
		TargetRef.ModFactionRank(DrunkFaction, -1)
	endif
	int DrunkPoints = TargetRef.GetFactionRank(DrunkFaction)
	if TargetRef.GetFactionRank(DrunkFactionMax) < DrunkPoints
		TargetRef.SetFactionRank(DrunkFactionMax, DrunkPoints)	
	endif	
	if DisplayMSG
		debug.notification("Current Inebriation Points = " + DrunkPoints)
	endif	
	;schofida - Changed drunk animation to start at end. (Player's basically immobile anyway)
	If (DrunkPoints >= 45) && (DrunkAnimations.GetValue() == 1) && !ANIM
		TargetRef.playidle(DrunkStart)
		ANIM = true
		if (TargetRef == Game.GetPlayer())
			Game.EnablePlayerControls()
		endif
	elseif ANIM && (DrunkPoints < 45)
		TargetRef.playidle(DrunkStop)
		Utility.Wait(1)
		TargetRef.playidle(FullStop)
		ANIM = false
	endif
	
	if (TargetRef == game.GetPlayer()) && (DrunkVisuals.GetValue() == 1)
		if (DrunkPoints >= 5) && !IMSP2; schofida - change
			Drunk02ISMD.Remove()
			Drunk02ISMD.Apply((DrunkPoints as float) / 30.0) ;schofida - factor Requiem's IMAD
			IMSP2 = true
		elseif (DrunkPoints < 5) && IMSP2; schofida - change
			Drunk02ISMD.Remove()
			IMSP2 = false	
		endif	
	endif

	if TargetRef.GetFactionRank(DrunkFaction) > 1
		RegisterForSingleUpdateGameTime(UpdateTime)
	else
		TargetRef.SetFactionRank(DrunkFaction, 0)
		TargetRef.removespell(SoberUpSpell)
		TargetRef.SetFactionRank(DrunkFactionMax, 0)
		TargetRef.SetFactionRank(ToleranceIncreasedFaction, 0)
		UnregisterForUpdateGameTime()
	endif
EndEvent


Event OnEffectFinish(actor akTarget, actor akCaster)
	UnregisterForUpdateGameTime()
	if IMSP2 ;schofida - change
		Drunk02ISMD.Remove()
		IMSP2 = false
	endif	
	if ANIM
		TargetRef.playidle(DrunkStop)
		Utility.Wait(1)
		TargetRef.playidle(FullStop)
		ANIM = false
	endif	
EndEvent
	
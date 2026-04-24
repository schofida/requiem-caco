Scriptname CACO_FoodEffectInebriation extends activemagiceffect  
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
						Incorporated Requiem's rules where player's health+stamina affect inebriation.
}
Faction Property DrunkFaction Auto
Faction Property ToleranceFaction Auto
Faction Property ToleranceIncreasedFaction Auto
Spell Property AlcoholEffect Auto
Idle property StandDrinking auto
Idle property ChairDrinking auto

GlobalVariable Property BaseTolerance Auto
GlobalVariable Property AlcoholLvl01 Auto
GlobalVariable Property AlcoholLvl02 Auto
GlobalVariable Property AlcoholLvl03 Auto
GlobalVariable Property AlcoholLvl04 Auto
GlobalVariable Property AlcoholLvl05 Auto
GlobalVariable Property DrinkAnimations Auto
int Property StrengthAmt = 10 Auto	;the alcoholic strength of this drink (default 10)
int Property RandomAmt = 0 Auto	;adds more variability for potentially watered down, generic items like village wine and ale (default 0, normal range 0-2) 


Event OnEffectStart(Actor akTarget, Actor akCaster)
	;if DrinkAnimations.GetValue() == 1
	;	if akTarget.GetSitState() == 0
	;		akTarget.playidle(StandDrinking)
	;	elseif akTarget.GetSitState() == 3
	;		akTarget.playidle(ChairDrinking)
	;	endif
	;endif
	if !akTarget.IsInFaction(DrunkFaction)
		akTarget.AddToFaction(DrunkFaction)
	endif
	if !akTarget.IsInFaction(ToleranceFaction)
		akTarget.AddToFaction(ToleranceFaction)
	endif	
	if !akTarget.HasSpell(AlcoholEffect)
		akTarget.AddSpell(AlcoholEffect, false)
	endif
	int StrengthRandom = Utility.RandomInt(-RandomAmt, RandomAmt)

	int GeneToleranceAmt = 0
; determine  'Disparity' tolerance...race, gender, weight (individual global toggles)
	;get DispToleranceFactionRank
		;if rank <= 0, then rankamt = 0	;dont' need
		;if rank =1, then rankamt = -2
		;if rank =2, then rankamt = -1
		;if rank =3, then rankamt = 0	; don't need
		;if rank =4, then rankamt = 1
		;if rank =5, then rankamt = 2
	;argonians = 3 or mod tolerancefaction by 15

	int IndvToleranceAmt = 0
	int ToleranceMult = BaseTolerance.GetValue() as int	; individual tolerance
	int 	ToleranceRank = akTarget.GetFactionRank(ToleranceFaction) as int
	if ToleranceRank >= ToleranceMult	
		if ToleranceRank >= (ToleranceMult*5)
			IndvToleranceAmt = 5
		elseif ToleranceRank >= (ToleranceMult*4)
			IndvToleranceAmt = 4
		elseif ToleranceRank >= (ToleranceMult*3)
			IndvToleranceAmt = 3
		elseif ToleranceRank >= (ToleranceMult*2)
			IndvToleranceAmt = 2
		else
			IndvToleranceAmt = 1
		endif
	endif
	
	int ResistAlc = akTarget.GetActorValue("PoisonResist") as int
	if ResistAlc >= 90
		IndvToleranceAmt = IndvToleranceAmt + 3
	elseif ResistAlc >= 60
		IndvToleranceAmt = IndvToleranceAmt + 2		
	elseif ResistAlc >= 30
		IndvToleranceAmt = IndvToleranceAmt + 1	
	endif	

	;schofida - Requiem factors player health and stamina
	float PlayerHealth = akTarget.GetActorValue("Health") + akTarget.GetActorValue("Stamina")
	if PlayerHealth >= 1100
		IndvToleranceAmt = IndvToleranceAmt + 3
	elseif PlayerHealth >= 700
		IndvToleranceAmt = IndvToleranceAmt + 2
	elseif PlayerHealth >= 300
		IndvToleranceAmt = IndvToleranceAmt + 1
	endif

	
;check for current active food effects...if food effects active: +2?

	int InebriationAmt = (StrengthAmt + StrengthRandom  - GeneToleranceAmt - IndvToleranceAmt) as int
	if InebriationAmt < 3
		InebriationAmt = 3
	endif
	akTarget.ModFactionRank(DrunkFaction, InebriationAmt)

	if (akTarget.GetFactionRank(ToleranceIncreasedFaction) <= 0) && (akTarget.GetFactionRank(DrunkFaction) >= AlcoholLvl04.GetValue() as int)
		akTarget.SetFactionRank(ToleranceIncreasedFaction, 1)
		akTarget.ModFactionRank(ToleranceFaction, 1)
	endif	
EndEvent




Scriptname CACO_FoodEffectInebriation extends activemagiceffect  

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

Perk Property REQ_CACO_PartyAnimal1 Auto
Perk Property REQ_CACO_PartyAnimal2 Auto

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
	if akTarget.HasPerk(REQ_CACO_PartyAnimal2)
		IndvToleranceAmt = 8
	elseif akTarget.HasPerk(REQ_CACO_PartyAnimal1)
		IndvToleranceAmt = 4
	elseif akTarget != Game.GetPlayer()
		IndvToleranceAmt = 2
	endif
	
	int ResistAlc = akTarget.GetActorValue("PoisonResist") as int
	if ResistAlc >= 90
		IndvToleranceAmt = IndvToleranceAmt + 3
	elseif ResistAlc >= 60
		IndvToleranceAmt = IndvToleranceAmt + 2		
	elseif ResistAlc >= 30
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




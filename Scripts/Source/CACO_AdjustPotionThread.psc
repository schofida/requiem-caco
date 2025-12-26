Scriptname CACO_AdjustPotionThread extends Quest hidden
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
						Change potion verbiage to Requiem's
						Change quality ordering to put at end
						Potions now weigh 0.6 x3+ - 0.5 x2 - 0.4 x1
}
bool thread_queued = false
bool thread_busy = false 									; KLV: this tracks whether we've actually started working (and therefore should ignore further trigger events)
Potion NewPotion
actor property PlayerRef auto
objectreference property ConverterChest auto
ObjectReference Property CreatedPotionContainer Auto
int Property RenameOption = 1 Auto
Keyword Property MagicAlchDurationBased Auto
Keyword Property MagicAlchHarmful Auto	
Keyword Property MagicAlchBeneficial Auto	
Keyword Property MagicAlchRestoreHealth Auto
Keyword Property MagicAlchRestoreStamina Auto
Keyword Property MagicAlchRestoreMagicka Auto
Keyword Property MagicAlchDamageHealth Auto
Keyword Property MagicAlchDamageStamina Auto
Keyword Property MagicAlchDamageMagicka Auto
Keyword Property MagicAlchCureDisease_CACO Auto
Keyword Property MagicAlchCurePoison_CACO Auto
Keyword Property MagicAlchBloodEffect_CACO Auto
FormList Property CACO_AlchemyEffectsList Auto				;this is a formlist containing all the alchemy magic effects
FormList Property CACO_AlchemyAllPotionList Auto			;this is an established formlist, which contains formlists of each potion effect
int property RestHpos = 0 auto
int property RestMpos = 0 auto
int property RestSpos = 0 auto
int property DamHpos = 0 auto
int property DamMpos = 0 auto
int property DamSpos = 0 auto
Perk Property Purity Auto
Perk Property ConcentratedPoison Auto
FormList Property CACO_AlchemyPotionWeightList02 Auto
FormList Property CACO_AlchemyPotionWeightList03 Auto
FormList Property CACO_AlchemyPotionWeightList04 Auto
FormList Property CACO_AlchemyCreatedPotionList Auto


ObjectReference function get_async(Potion akPotion, int iDamageHealthDuration, int iDamageMagickaDuration, int iDamageStaminaDuration, int iRestoreHealthDuration, int iRestoreMagickaDuration, int iRestoreStaminaDuration)			;Thread queuing and set-up	
	thread_queued = true			;Let the Thread Manager know that this thread is busy
	RestHpos = iRestoreHealthDuration
	RestMpos = iRestoreMagickaDuration
	RestSpos = iRestoreStaminaDuration
	DamHpos = iDamageHealthDuration
	DamMpos = iDamageMagickaDuration
	DamSpos = iDamageStaminaDuration
	NewPotion = akPotion
endFunction
 
bool function queued()										;Allows the Thread Manager to determine if this thread is available
	return thread_queued
endFunction
 
bool function force_unlock()								;For Thread Manager troubleshooting.
    clear_thread_vars()
    thread_queued = false
	thread_busy = false
    return true
endFunction
 
Event OnPotionCreation()
	; KLV: if we're not queued, or if we're already busy, ignore the event coming in
	if !thread_queued || thread_busy
		return
	endif

	; KLV: update to say we're busy, so we don't get re-started
	thread_busy = true
		
	PlayerRef.RemoveItem(NewPotion as form, 1, true, ConverterChest)
	objectreference MyPotionRef = ConverterChest.DropObject(NewPotion as form, 1)
	string sNewPotionName = NewPotion.GetName()
	string sMyPotionName = MyPotionRef.GetBaseObject().GetName()		
	if MyPotionRef.HasKeyword(MagicAlchBeneficial) && MyPotionRef.HasKeyword(MagicAlchHarmful)			;This Potion is Impure
		ImpurePotion(MyPotionRef)
		CalculateWeight(MyPotionRef)
	else																								;This Potion is pure; it does not have mixed positive and negative effects
		CalculateWeight(MyPotionRef)
	endIf
	if RenameOption ==1
		RenameReference(MyPotionRef)
	endif	
	PlayerRef.AddItem(MyPotionRef, 1, true)	
	CACO_AlchemyCreatedPotionList.AddForm(MyPotionRef.GetBaseObject())		
	clear_thread_vars()				;Set all variables back to default
	thread_queued = false		    ;Make the thread available to the Thread Manager again
	thread_busy = false		    	; KLV: ..and remind it that it's not busy	
endEvent
 
 
 ;--------------------------FUNCTIONS--------------------------
 
Function RenameReference(ObjectReference akPotionRef)
	Potion BasePotion = akPotionRef.GetBaseObject() as potion	
	;====================
	;Determine Primary Effect
	;====================
	;Int Index = BasePotion.GetCostliestEffectIndex()							
	;GetCostliestEffectIndex seems to look at the base cost for each effect, rather than the actual gold value that the effects contribute to the potion.
	MagicEffect PrimaryEffect = BasePotion.GetNthEffectMagicEffect(0)	;player-made potions should automatically sort the potions by effect value
	Float Magnitude = BasePotion.GetNthEffectMagnitude(0)
	Int Duration = BasePotion.GetNthEffectDuration(0)
	Int EffectNum = CACO_AlchemyEffectsList.Find(PrimaryEffect)
	Formlist ComparePotionList = CACO_AlchemyAllPotionList.GetAt(EffectNum) as Formlist
	Potion Potion1 = ComparePotionList.GetAt(1) as Potion
	Potion Potion2 = ComparePotionList.GetAt(2) as Potion
	Potion Potion3 = ComparePotionList.GetAt(3) as Potion	 
	Potion Potion4 = ComparePotionList.GetAt(4) as Potion
	if !ComparePotionList || !Potion1		
		debug.notification("Error: CACO does not recognize this Alchemy Effect.")	
	endif
	
	;====================
	;Determine Quality
	;====================
	String sPotionQuality = ""																	
	if BasePotion.HasKeyword(MagicAlchHarmful) && BasePotion.HasKeyword(MagicAlchBeneficial)
				sPotionQuality = " (Impure)"	;schofida - change
	elseif PrimaryEffect.HasKeyword(MagicAlchDurationBased) 
		If Duration < Potion1.GetNthEffectDuration(0) as int
				sPotionQuality = " (Diluted)"		;schofida - change
		elseif (Duration >= Potion1.GetNthEffectDuration(0) as int) && (Duration < Potion2.GetNthEffectDuration(0) as int)
				sPotionQuality = " (Faint)"		;schofida - change
		elseif (Duration >= Potion2.GetNthEffectDuration(0) as int) && (Duration < Potion3.GetNthEffectDuration(0) as int)
				sPotionQuality = " (Fair)"	;schofida - change
		elseif !Potion4 && (Duration >= Potion3.GetNthEffectDuration(0) as int)
				sPotionQuality = " (Good)"	;schofida - change
		elseif (Duration >= Potion3.GetNthEffectDuration(0) as int) && (Duration < Potion4.GetNthEffectDuration(0) as int)
				sPotionQuality = " (Good)"	;schofida - change
		elseif Duration >= Potion4.GetNthEffectDuration(0) as int
				sPotionQuality = " (Remarkable)"	;schofida - change
		else
			debug.notification("Error:  Could not determine Quality of this potion.")
		endif
	Else	
		If PrimaryEffect.HasKeyword(MagicAlchCureDisease_CACO) || PrimaryEffect.HasKeyword(MagicAlchCurePoison_CACO) || PrimaryEffect.HasKeyword(MagicAlchBloodEffect_CACO)
			sPotionQuality = ""
		else
			int pos = 0
			if PrimaryEffect.HasKeyword(MagicAlchRestoreHealth)
				pos = RestHpos
			elseif PrimaryEffect.HasKeyword(MagicAlchRestoreMagicka)
				pos = RestMpos
			elseif PrimaryEffect.HasKeyword(MagicAlchRestoreStamina)
				pos = RestSpos
			elseif PrimaryEffect.HasKeyword(MagicAlchDamageHealth)
				pos = DamHpos
			elseif PrimaryEffect.HasKeyword(MagicAlchDamageMagicka)
				pos = DamMpos
			elseif PrimaryEffect.HasKeyword(MagicAlchDamageStamina)
				pos = DamSpos
			endif
			If Magnitude < (Potion1.GetNthEffectMagnitude(pos)) as int
				sPotionQuality = " (Diluted)"		;schofida - change
			elseif (Magnitude >= Potion1.GetNthEffectMagnitude(pos) as int) && (Magnitude < Potion2.GetNthEffectMagnitude(0) as int)
				sPotionQuality = " (Faint)"		;schofida - change
			elseif (Magnitude >= Potion2.GetNthEffectMagnitude(pos) as int) && (Magnitude < Potion3.GetNthEffectMagnitude(0) as int)
				sPotionQuality = " (Fair)"	;schofida - change
			elseif !Potion4 && (Magnitude >= Potion3.GetNthEffectMagnitude(pos) as int)
					sPotionQuality = " (Good)"	 	;schofida - change 
			elseif (Magnitude >= Potion3.GetNthEffectMagnitude(pos) as int) && (Magnitude < Potion4.GetNthEffectMagnitude(pos) as int)
					sPotionQuality = " (Good)"		;schofida - change
			elseif Magnitude >= (Potion4.GetNthEffectMagnitude(pos) as int)
					sPotionQuality = " (Remarkable)"	;schofida - change
			else
				debug.notification("Error: Could not determine Quality of this potion.")
			endif
		endif	
	Endif
		
		;============================
		;Determine Named Effects
		;============================
		int numEffects = BasePotion.GetNumEffects() as int
		String sPotionType = "Potion"	
		String sPotionName = PrimaryEffect.GetName()	
		if numEffects >= 3
			if PrimaryEffect.HasKeyword(MagicAlchHarmful)
				sPotionType = "Poison"	
			else	
				sPotionType = "Elixir"	
			endif
			akPotionRef.SetDisplayName(sPotionType + " of " + sPotionName + sPotionQuality)	;schofida - change
		elseif numEffects == 2
				if PrimaryEffect.HasKeyword(MagicAlchHarmful)
					sPotionType = "Poison"	
				else	
					sPotionType = "Draught"	
				endif
				String SecEffectName = ""
				SecEffectName = (BasePotion.GetNthEffectMagicEffect(1) as MagicEffect).GetName()
			akPotionRef.SetDisplayName(sPotionType + " of " + sPotionName + " & " + SecEffectName + sPotionQuality)	;schofida - change		
		elseif numEffects == 1
				if PrimaryEffect.HasKeyWord(MagicAlchHarmful)
					sPotionType = "Poison"	
				else	
					sPotionType = "Potion"	
				endif
			akPotionRef.SetDisplayName(sPotionType + " of " + sPotionName + sPotionQuality)	;schofida - change			
		else
			;debug.notification("Error: No effects registered for this potion.")   	;potion had no effects. Something went wrong.
		EndIf	
EndFunction
 
 
function ImpurePotion(ObjectReference akPotionRef)
	Potion BasePotion = akPotionRef.GetBaseObject() as potion
	DP_Extender.SetAlchAutoCalcFlag(BasePotion, false) 						;turn off auto-calc flag so that SKSE SetGoldValue will work
	BasePotion.SetGoldValue((BasePotion.GetGoldValue() * 0.2) as int)			;SetGoldValue doesn't work for potions if auto-calc is flagged 
 	int numEffects = BasePotion.GetNumEffects() as int
	int x = 0
	while (x < numEffects)		; KLV: changed the <= to just <
		MagicEffect effectX = BasePotion.GetNthEffectMagicEffect(x)	
		if effectX.HasKeyword(MagicAlchDurationBased)
			BasePotion.SetNthEffectDuration(x, (BasePotion.GetNthEffectDuration(x) * 0.2) as int)
		else
			BasePotion.SetNthEffectMagnitude(x, (BasePotion.GetNthEffectMagnitude(x) * 0.2) as float)
		endif	
		x += 1
	endWhile	
	;should I adjust XP as well?
EndFunction
 
 
 function CalculateWeight(ObjectReference akPotionRef)
	Potion BasePotion = akPotionRef.GetBaseObject() as potion
 	int numEffects = BasePotion.GetNumEffects() as int
	if numEffects >= 3
		If BasePotion.HasKeyword(MagicAlchHarmful) && !BasePotion.HasKeyword(MagicAlchBeneficial) && PlayerRef.HasPerk(ConcentratedPoison)
		elseif BasePotion.HasKeyword(MagicAlchBeneficial) && !BasePotion.HasKeyword(MagicAlchHarmful) && PlayerRef.HasPerk(Purity)
		else
			BasePotion.SetWeight(0.6)
			CACO_AlchemyPotionWeightList04.AddForm(BasePotion)	
		endif	
		;modify model string?
	elseif numEffects == 2
		If BasePotion.HasKeyword(MagicAlchHarmful) && !BasePotion.HasKeyword(MagicAlchBeneficial) && PlayerRef.HasPerk(ConcentratedPoison)
			BasePotion.SetWeight(0.4)
			CACO_AlchemyPotionWeightList03.AddForm(BasePotion)
		elseif BasePotion.HasKeyword(MagicAlchBeneficial) && !BasePotion.HasKeyword(MagicAlchHarmful) && PlayerRef.HasPerk(Purity)
			BasePotion.SetWeight(0.4)
			CACO_AlchemyPotionWeightList03.AddForm(BasePotion)
		endif	
		;modify model string?
	elseif numEffects == 1
		If BasePotion.HasKeyword(MagicAlchHarmful) && !BasePotion.HasKeyword(MagicAlchBeneficial) && PlayerRef.HasPerk(ConcentratedPoison)
			BasePotion.SetWeight(0.3)
			CACO_AlchemyPotionWeightList02.AddForm(BasePotion)
		elseif BasePotion.HasKeyword(MagicAlchBeneficial) && !BasePotion.HasKeyword(MagicAlchHarmful) && PlayerRef.HasPerk(Purity)
			BasePotion.SetWeight(0.3)
			CACO_AlchemyPotionWeightList02.AddForm(BasePotion)
		else
			BasePotion.SetWeight(0.4)
			CACO_AlchemyPotionWeightList03.AddForm(BasePotion)		
		endif	
		;modify model string?
	endIf
EndFunction


function clear_thread_vars()
	;Reset all thread variables to default state
	NewPotion = None
endFunction


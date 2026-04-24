Scriptname CACO_MCMScript extends SKI_ConfigBase
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
	-	Added cosmetic changes to MCM descriptions for the potion distilling recipe toggle and the sliders for selling crops
	-	Created new function that gets fired on player alias init or game load and when alchemy crafting window opens/closes
		This function will adjust ingredient magnitudes to tone down ingredient values when eating.
		New mechanic. There are a few special ingredients that will multiply the variable durations.
		New mechanic. Restoration durations are now 1, 10, 20
}	
int OIDAdditionalMinIngr
int OIDAdditionalMinMeat
int OIDExtraIngrPrePerkChance
int OIDExtraIngrPostPerkChance
int OIDAddIngr 
int OIDAddFoods
int OIDAddTools
int OIDLearnEffects
int OIDSwapItems
int OIDSwapSoulHusk
int OIDSwapHorkerTusk
int OIDSwapDragonScales
int OIDSwapHumanFlesh
int OIDSwapSkeeverHide
int OIDSwapBoneHawkClaw
int OIDSwapBoneHawkFeather
int OIDSwapScalpel
int OIDHealthDur 
int OIDStaminaDur
int OIDMagickaDur
int OIDHealthDamDur 
int OIDStaminaDamDur
int OIDMagickaDamDur
int OIDRenamePotions
int OIDStackableEffects
int OIDVampireRestoreHealth
int OIDRequireMortar
int OIDDeadlyVenom
int OIDWaterWellEnable
int OIDWaterWellBucket
int OIDCookingXPEnabled
int OIDCookingXPMult
int OIDCurrentCookingSkill
int OIDCurrentCookingRank
int OIDDrunkAnimations
int OIDDrunkMessages
int OIDDrunkVisuals
int OIDDrunkTolerance
int OIDBasicNeedsHungerEnable
int OIDBasicNeedsFatigueEnable
int OIDBasicNeedsNotifications
int OIDSleepChangesEnable
int OIDSleepAllowWerewolf
int OIDSleepMinHours
int OIDCraftFreeWater
int OIDAlchemyInventoryCond
int OIDCookingInventoryCond
int OIDCookingNewRecipes
int OIDHarvestFlesh
;int OIDCookingCannibalism
int OIDMarkAsEaten
int OIDXPNotifications
int OIDCookingCombinePortions
int OIDToggleDistillPotionRecipes
int OIDBombNotifications
int OIDLoadScreens
int OIDJobFarmWheat
int OIDJobFarmPotato
int OIDJobFarmNirnroot
int OIDJobFarmLeek
int OIDJobFarmGourd
int OIDJobFarmCabbage
int OIDPotionWeights
int OIDUpdateiNeedLists
int OIDRagdollParalysis
int OIDStopAnimations
int OIDDisableWorkbenchOptions
int OIDDisableChurnOptions
int OIDMilkCows
int OIDFoodFrequency
int OIDFoodQuantity
int OIDHarvestBodyMsgBox
int OIDGardenFertilizerOption
int OIDGardenFertilizerTime
int OIDGardenInitialTime
int OIDGardenRegrowTime
int OIDAlchemyXPRate
int OIDRecipesTeachEffects

GlobalVariable property CACOExtraIngrMin_KRY Auto
GlobalVariable property CACOExtraIngrChance_KRY Auto
GlobalVariable property CACOExtraIngrChancePostPerk_KRY Auto
GlobalVariable property CACOIgnoreIngAddition_KRY Auto
GlobalVariable property CACORenamePotionOption_KRY Auto
GlobalVariable property CACO_RestoreStaminaDuration Auto
GlobalVariable property CACO_RestoreMagickaDuration Auto
GlobalVariable property CACO_RestoreHealthDuration Auto
GlobalVariable property CACO_DamageStaminaDuration Auto
GlobalVariable property CACO_DamageMagickaDuration Auto
GlobalVariable property CACO_DamageHealthDuration Auto
GlobalVariable property CACO_NoRestoreHealthForVampires Auto
GlobalVariable property CACO_RequireMortarToUseLab Auto
GlobalVariable property CACO_VenomDamageLevel Auto
GlobalVariable property CACOExtraIngrCreatureChance_KRY Auto
GlobalVariable property CACOExtraMeatMin_KRY Auto
GlobalVariable Property CACO_DrinkingAnimations Auto
GlobalVariable Property CACO_AlcoholicBaseTolerance Auto
GlobalVariable Property CACO_WellActivatorEnabled Auto
GlobalVariable Property CACO_WellActivatorRequireBucket Auto
GlobalVariable Property CACO_PlayerCookingSkillLVL Auto
GlobalVariable Property CACO_PlayerCookingXPMult Auto
GlobalVariable Property CACO_PlayerCookingXPEnabled Auto
GlobalVariable Property CACO_AlcoholDrunkAnimations Auto
GlobalVariable Property CACO_AlcoholDrunkMessages Auto
GlobalVariable Property CACO_AlcoholDrunkVisuals Auto
GlobalVariable Property CACO_BasicNeedsHungerEnabled Auto
GlobalVariable Property CACO_BasicNeedsFatigueEnabled Auto
GlobalVariable Property CACO_BasicNeedsNotifications Auto
GlobalVariable Property CACO_FoodCraftFreeWater Auto
GlobalVariable Property CACO_OptionDeclutterAlchemyMenu Auto
GlobalVariable Property CACO_OptionDeclutterCraftingMenu Auto
GlobalVariable Property CACO_OptionCannibalism Auto
GlobalVariable Property CACO_OptionDisableHarvestFlesh Auto
GlobalVariable Property CACO_OptionMilkCows Auto
GlobalVariable Property CACO_OptionMilkCowsPlayerOnly Auto
GlobalVariable Property CACO_OptionCombinePortions Auto
GlobalVariable Property CACO_OptionDistillPotions Auto
GlobalVariable Property CACO_CACOAddedRecipes Auto
GlobalVariable Property CACO_PlayerCookingSkillRank Auto
GlobalVariable Property CACO_SleepChangesEnabled Auto
GlobalVariable Property CACO_AllowWerewolfRested Auto
GlobalVariable Property CACO_SleepMinHoursRested Auto
GlobalVariable Property CACO_OptionBombNotifications Auto
GlobalVariable Property CACO_OptionCookingXPNotifications Auto
GlobalVariable Property CACO_LoadScreens Auto
GlobalVariable Property CACO_JobFarmCabbageAmt Auto
GlobalVariable Property CACO_JobFarmGourdAmt Auto
GlobalVariable Property CACO_JobFarmLeekAmt Auto
GlobalVariable Property CACO_JobFarmNirnrootAmt Auto
GlobalVariable Property CACO_JobFarmPotatoAmt Auto
GlobalVariable Property CACO_JobFarmWheatAmt Auto
GlobalVariable Property CACO_OptionMarkAsEaten Auto
GlobalVariable Property CACO_OptionRagdollParalysis Auto
GlobalVariable Property CACO_OptionDisableWorkbenchChanges Auto
GlobalVariable Property CACO_OptionDisableChurnChanges Auto
GlobalVariable Property CACO_ModiNeedInst Auto
GlobalVariable Property CACO_ExtraFoodChance Auto
GlobalVariable Property CACO_ExtraFoodSpecial25Chance Auto
GlobalVariable Property CACO_FoodBarrelChance Auto
GlobalVariable Property CACO_FoodBarrelDefault100Chance Auto
GlobalVariable Property CACO_FoodSackChance Auto
GlobalVariable Property CACO_FoodSackDefault100Chance Auto
GlobalVariable Property CACO_OptionHarvestBodyMsgBox Auto
GlobalVariable Property CACO_OptionFertilizerEffect Auto
GlobalVariable Property CACO_GardenFertilizerDays Auto
GlobalVariable Property CACO_GardenInitialGrowDays Auto
GlobalVariable Property CACO_GardenRegrowDays Auto
GlobalVariable Property CACO_OptionAlchXPRate Auto
GlobalVariable Property CACO_OptionNotesLearnEffects Auto

Formlist Property CACO_RestoreIngH1st Auto
Formlist Property CACO_RestoreIngH2nd Auto
Formlist Property CACO_RestoreIngH3rd Auto
Formlist Property CACO_RestoreIngH4th Auto
Formlist Property CACO_RestoreIngS1st Auto
Formlist Property CACO_RestoreIngS2nd Auto
Formlist Property CACO_RestoreIngS3rd Auto
Formlist Property CACO_RestoreIngS4th Auto
Formlist Property CACO_RestoreIngM1st Auto
Formlist Property CACO_RestoreIngM2nd Auto
Formlist Property CACO_RestoreIngM3rd Auto
Formlist Property CACO_RestoreIngM4th Auto
Formlist Property CACO_DamageIngH1st Auto
Formlist Property CACO_DamageIngH2nd Auto
Formlist Property CACO_DamageIngH3rd Auto
Formlist Property CACO_DamageIngH4th Auto
Formlist Property CACO_DamageIngS1st Auto
Formlist Property CACO_DamageIngS2nd Auto
Formlist Property CACO_DamageIngS3rd Auto
Formlist Property CACO_DamageIngS4th Auto
Formlist Property CACO_DamageIngM1st Auto
Formlist Property CACO_DamageIngM2nd Auto
Formlist Property CACO_DamageIngM3rd Auto
Formlist Property CACO_DamageIngM4th Auto
Formlist Property CACO_StackableHealthEffects Auto
Formlist Property CACO_StackableMagickaEffects Auto
Formlist Property CACO_StackableStaminaEffects Auto
Formlist Property AllIngredientFormList Auto
FormList Property CACO_AlchemyPotionWeightList02 Auto
FormList Property CACO_AlchemyPotionWeightList03 Auto
FormList Property CACO_AlchemyPotionWeightList04 Auto
FormList Property CACO_RagdollParalysisEffectList Auto
Perk Property CACO_AnatomistPerk Auto
Perk Property CACO_HarvestBloodPerk Auto
Perk Property CACO_HarvestBloodPerkMsgBox Auto
Perk Property CACO_AlchXPRate Auto

float AdjustedMinVal = 1.0
float AdjustedMinMeatVal = 1.0
float ExtraIngrPrePerkVal = 30.0
float ExtraIngrPostPerkVal = 60.0
float ExtraMeatVal = 50.0
float XPMultVal = 1.0
float AlchXPMultVal = 1.0
float ToleranceVal = 5.0
float MinHoursRestedVal = 6.0
float GardenFertilizerVal = 30.0
float GardenInitialVal = 3.0
float GardenRegrowVal = 3.0
String[] DurationList
String[] DurationDamList
String[] DifficultyList
String[] CookRankList
String[] NeedsList
String[] FoodQuantityList
String[] FoodFrequencyList
String[] MilkOptList
String[] FertilizerOptList
String[] FleshOptList
int NeedNotificationVal
int CookRankVal
int HealthDurVal = 2
int StaminaDurVal = 2
int MagickaDurVal = 2
int HealthDamVal
int StaminaDamVal 
int MagickaDamVal 
int currentval
int HarvestChance
int MilkOptVal
int FleshOptVal
int EffectsDontStackVal = 1
int VenomVal
int HarvestOptVal
int CookingXPVal = 1
int SleepChangeEnableVal = 1
int FoodFreqVal
int FoodQuantVal
int FertilizerOptVal
Potion CurrentPotion

Quest property AdjustPotionQuest auto
Perk Property GreenThumb Auto
int ItemCount
Ingredient Property CACOSoulHusk Auto
Potion Property VanSoulHusk Auto
Ingredient Property CACOHorkerTusk Auto
MiscObject Property VanHorkerTusk Auto
Potion Property CACOHumanFlesh Auto
Ingredient Property VanHumanFlesh Auto
Potion Property CACOSkeeverHide Auto
Ingredient Property VanSkeeverHide Auto
Ingredient Property CACOHeartScales Auto
MiscObject Property VanHeartScales Auto
Ingredient Property CACOBoneHawkClaw Auto
MiscObject Property VanBoneHawkClaw Auto
Ingredient Property CACOBoneHawkFeather Auto
MiscObject Property VanBoneHawkFeather Auto
MiscObject Property VanScalpel Auto
Weapon Property CACOScalpel Auto
LeveledItem Property CACO_AllIngredients Auto
LeveledItem Property CACO_AllTools Auto
LeveledItem Property CACO_AllFood Auto
int fxduration
Potion Property RestedPotion Auto
MagicEffect Property AlchRestoreHealth_1sec Auto
MagicEffect Property AlchRestoreHealth_5sec Auto
MagicEffect Property AlchRestoreHealth_10sec Auto
MagicEffect Property AlchRestoreHealthBlood_1sec Auto
MagicEffect Property AlchRestoreHealthBlood_5sec Auto
MagicEffect Property AlchRestoreHealthBlood_10sec Auto
MagicEffect Property AlchRestoreStamina_1sec Auto
MagicEffect Property AlchRestoreStamina_5sec Auto
MagicEffect Property AlchRestoreStamina_10sec Auto
MagicEffect Property AlchRestoreMagicka_1sec Auto
MagicEffect Property AlchRestoreMagicka_5sec Auto
MagicEffect Property AlchRestoreMagicka_10sec Auto
MagicEffect Property AlchDamageHealth_1sec Auto
MagicEffect Property AlchDamageHealth_5sec Auto
MagicEffect Property AlchDamageHealth_10sec Auto
MagicEffect Property AlchDamageStamina_1sec Auto
MagicEffect Property AlchDamageStamina_5sec Auto
MagicEffect Property AlchDamageStamina_10sec Auto
MagicEffect Property AlchDamageMagicka_1sec Auto
MagicEffect Property AlchDamageMagicka_5sec Auto
MagicEffect Property AlchDamageMagicka_10sec Auto
MagicEffect Property AlchDamageUndead_1sec Auto
MagicEffect Property AlchDamageUndead_5sec Auto
MagicEffect Property AlchDamageUndead_10sec Auto
MagicEffect Property AlchFortifyAlteration Auto
MagicEffect Property AlchFortifyDestruction Auto
MagicEffect Property AlchFortifyConjuration Auto
MagicEffect Property AlchFortifyIllusion Auto
MagicEffect Property AlchFortifyRestoration Auto
Keyword Property MagicAlchRestoreHealth Auto
Keyword Property MagicAlchRestoreMagicka Auto
Keyword Property MagicAlchRestoreStamina Auto

CACO_PlayerLoadGameAlias Property CACOQuest auto
Idle property DrunkStop auto
Idle property ForceDefaultState auto
Actor property PlayerRef auto

;schofida - Below added by REQ_CACO
Ingredient[] Property REQ_CACO_FixIngConsume Auto
Float[] Property REQ_CACO_CACOIngrMags Auto
Float[] Property REQ_CACO_REQIngrMagsx2 Auto
Float[] Property REQ_CACO_REQIngrMags Auto
Ingredient[] Property REQ_CACO_SpecialIngrs Auto
Int[] Property REQ_CACO_SpecialIngrsMultiplier Auto

int function GetVersion()
	return 3
endFunction

event OnVersionUpdate(int a_version)
	if (a_version > 1)
		OnConfigInit()
	endIf
endEvent

event OnConfigInit()
	Pages = new string[6]
	Pages[0] = "$CACOAlchemy"
	Pages[1] = "$CACOCooking"
	Pages[2] = "$CACOHarvest"
	Pages[3] = "$CACOFarming"	
	Pages[4] = "$CACONeeds"
	Pages[5] = "$CACOHelp"

	DurationList = New String[3]
	DurationList[0] = "$CACO1sec"
	DurationList[1] = "$CACO5secs"
	DurationList[2] = "$CACO10secs"
	
	DurationDamList = New String[3]
	DurationDamList[0] = "$CACO1Damsec"
	DurationDamList[1] = "$CACO5Damsecs"
	DurationDamList[2] = "$CACO10Damsecs"

	DifficultyList = New String[3]
	DifficultyList[0] = "$CACOVanilla"
	DifficultyList[1] = "$CACODangerous"
	DifficultyList[2] = "$CACODeadly"
	
	CookRankList = New String[5]
	CookRankList[0] = "$CACOBeginner"
	CookRankList[1] = "$CACOCook"
	CookRankList[2] = "$CACOChef"	
	CookRankList[3] = "$CACOConnoisseur"		
	CookRankList[4] = "$CACOGourmand"		
	
	NeedsList = New String[3]
	NeedsList[0] = "$CACONone"
	NeedsList[1] = "$CACO3rdPerson"
	NeedsList[2] = "$CACO1stPerson"
	
	FoodQuantityList = New String[4]
	FoodQuantityList[0] = "$CACOAbundant"
	FoodQuantityList[1] = "$CACOReduced"
	FoodQuantityList[2] = "$CACOVeryFew"
	FoodQuantityList[3] = "$CACOSingleItem"
	
	FoodFrequencyList = New String[4]
	FoodFrequencyList[0] = "$CACOCommon"
	FoodFrequencyList[1] = "$CACOUncommon"
	FoodFrequencyList[2] = "$CACOScarce"
	FoodFrequencyList[3] = "$CACONever"	
	
	MilkOptList = New String [3]
	MilkOptList[0] = "$CACOPlayerOwned"
	MilkOptList[1] = "$CACOAll"	
	MilkOptList[2] = "$CACONone"	
	
	FleshOptList = New String [3]
	FleshOptList[0] = "$CACOAfterQuest"
	FleshOptList[1] = "$CACOAlwaysAllow"	
	FleshOptList[2] = "$CACODisable"		
	
	FertilizerOptList = New String [3]
	FertilizerOptList[0] = "$CACOGrowingTime"
	FertilizerOptList[1] = "$CACOHarvestAmount"	
	FertilizerOptList[2] = "$CACOBoth"	
endEvent

event OnPageReset(string page)
	If (page == "")
		LoadCustomContent("CompleteAlchemyOverhaul/CACOTitle.dds", 26, 115)
		Return
	Else
		UnloadCustomContent()
	EndIf
	If (page == "$CACOAlchemy")
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("$CACOPotionDuration")
		OIDHealthDur = AddTextOption("$CACORestoreHealth", DurationList[HealthDurVal])
		OIDMagickaDur = AddTextOption("$CACORestoreMagicka", DurationList[MagickaDurVal])
		OIDStaminaDur = AddTextOption("$CACORestoreStamina", DurationList[StaminaDurVal])
		AddEmptyOption()
		AddHeaderOption("$CACOEffectOptions")
		OIDStackableEffects = AddToggleOption("$CACONoStacking", EffectsDontStackVal)
		OIDVampireRestoreHealth = AddToggleOption("$CACONoVampireRestore", CACO_NoRestoreHealthForVampires.GetValue() as int)
		AddEmptyOption()
		AddHeaderOption("$CACORecipeOptions")
		OIDRecipesTeachEffects = AddToggleOption("$CACOLearnRecipes", CACO_OptionNotesLearnEffects.GetValue() as int) 
		OIDAlchemyInventoryCond = AddToggleOption("$CACORetortConditions", CACO_OptionDeclutterAlchemyMenu.GetValue() as int)
		OIDToggleDistillPotionRecipes = AddToggleOption("$CACODistillRecipes", CACO_OptionDistillPotions.GetValue() as int)
		
		SetCursorPosition(1)		;start right-hand column
		AddHeaderOption("$CACOPoisonDuration")
		OIDHealthDamDur = AddTextOption("$CACODamageHealth", DurationDamList[HealthDamVal])
		OIDMagickaDamDur = AddTextOption("$CACODamageMagicka", DurationDamList[MagickaDamVal])
		OIDStaminaDamDur = AddTextOption("$CACODamageStamina", DurationDamList[StaminaDamVal])
		AddEmptyOption()
		AddHeaderOption("$CACOOtherOptions")
		OIDAlchemyXPRate = AddSliderOption("$CACOXPMultiplier", AlchXPMultVal, "{1.00}")
		OIDRenamePotions = AddToggleOption("$CACORenamePlayerPotions", CACORenamePotionOption_KRY.GetValue() as int)
		OIDRequireMortar = AddToggleOption("$CACORequireMortar", CACO_RequireMortarToUseLab.GetValue() as int)
		OIDBombNotifications = AddToggleOption("$CACOBombNotifications", CACO_OptionBombNotifications.GetValue() as int)
		OIDLoadScreens = AddToggleOption("$CACOLoadScreens", CACO_LoadScreens.GetValue() as int)

	elseif (page == "$CACOCooking")
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("$CACOCookingSkill")
		OIDCookingXPEnabled = AddToggleOption("$CACOEnableCookSkill", CACO_PlayerCookingXPEnabled.GetValue() as int)
		If CookingXPVal == 0
			OIDCurrentCookingSkill = AddTextOption("$CACOCookSkillLevel", CACO_PlayerCookingSkillLVL.GetValue() as int, OPTION_FLAG_DISABLED)
			OIDCurrentCookingRank = AddTextOption("$CACOCookSkillRank", CookRankList[CACO_PlayerCookingSkillRank.GetValue() as int], OPTION_FLAG_DISABLED)
			OIDCookingXPMult = AddSliderOption("$CACOXPMultiplier", XPMultVal, "{1}", OPTION_FLAG_DISABLED)
			OIDXPNotifications = AddToggleOption("$CACOXPNotifications", CACO_OptionCookingXPNotifications.GetValue() as int, OPTION_FLAG_DISABLED)
		else
			OIDCurrentCookingSkill = AddTextOption("$CACOCookSkillLevel", CACO_PlayerCookingSkillLVL.GetValue() as int, OPTION_FLAG_NONE)
			OIDCurrentCookingRank = AddTextOption("$CACOCookSkillRank", CookRankList[CACO_PlayerCookingSkillRank.GetValue() as int], OPTION_FLAG_NONE)
			OIDCookingXPMult = AddSliderOption("$CACOXPMultiplier", XPMultVal, "{1}", OPTION_FLAG_NONE)	
			OIDXPNotifications = AddToggleOption("$CACOXPNotifications", CACO_OptionCookingXPNotifications.GetValue() as int, OPTION_FLAG_NONE)			
		endif	
		AddEmptyOption()
		AddHeaderOption("$CACORecipeOptions")	
		OIDCookingNewRecipes = AddToggleOption("$CACOAddedCookingRecipes", CACO_CACOAddedRecipes.GetValue() as int)
		OIDCookingInventoryCond = AddToggleOption("$CACOCookingConditions", CACO_OptionDeclutterCraftingMenu.GetValue() as int)

		SetCursorPosition(1)		;start right-hand column	
		AddHeaderOption("$CACOWater")
		OIDCraftFreeWater = AddToggleOption("$CACOCraftWater", CACO_FoodCraftFreeWater.GetValue() as int)
		OIDWaterWellEnable = AddToggleOption("$CACOWaterFromWells", CACO_WellActivatorEnabled.GetValue() as int)		
		OIDWaterWellBucket = AddToggleOption("$CACORequireBucket", CACO_WellActivatorRequireBucket.GetValue() as int)	
		AddEmptyOption()
		AddHeaderOption("$CACOAlcohol")
		OIDDrunkVisuals = AddToggleOption("$CACODrunkenVisuals", CACO_AlcoholDrunkVisuals.GetValue() as int)
		OIDDrunkAnimations = AddToggleOption("$CACODrunkenAnimations", CACO_AlcoholDrunkAnimations.GetValue() as int)		
		OIDDrunkMessages = AddToggleOption("$CACOInebriationMessages", CACO_AlcoholDrunkMessages.GetValue() as int)		
		OIDDrunkTolerance = AddSliderOption("$CACOToleranceRate", ToleranceVal, "{0}")		

	elseif (page == "$CACOHarvest")	
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("$CACOIngredients")
		if AdjustedMinVal == 1
			OIDAdditionalMinIngr = AddTextOption("$CACOMinimumIngredients", "$CACOAdjusted")
		else
			OIDAdditionalMinIngr = AddTextOption("$CACOMinimumIngredients", "$CACOVanilla")
		endif
		OIDExtraIngrPrePerkChance = AddSliderOption("$CACOPrePerkIngrChance", ExtraIngrPrePerkVal, "{0}%")
		OIDExtraIngrPostPerkChance = AddSliderOption("$CACOPostPerkIngrChance", ExtraIngrPostPerkVal, "{0}%")
		AddEmptyOption()
		AddHeaderOption("$CACOFoodContainers")
		OIDFoodFrequency = AddTextOption("$CACOFrequency", FoodFrequencyList[FoodFreqVal])
		OIDFoodQuantity = AddTextOption("$CACOQuantity", FoodQuantityList[FoodQuantVal])			
		
		SetCursorPosition(1)		;start right-hand column
		AddHeaderOption("$CACOCreatures&NPCs")
		if AdjustedMinMeatVal == 1
			OIDAdditionalMinMeat = AddTextOption("$CACOMeatAmount", "$CACOAdjusted")
		else
			OIDAdditionalMinMeat = AddTextOption("$CACOMeatAmount", "$CACOVanilla")
		endif		
		OIDMilkCows = AddTextOption("$CACOMilk&Wool", MilkOptList[MilkOptVal])
		OIDDeadlyVenom = AddTextOption("$CACODeadlyVenoms", DifficultyList[VenomVal])		
		AddEmptyOption()
		OIDHarvestFlesh = AddTextOption("$CACOHarvestFlesh", FleshOptList[FleshOptVal])
		if HarvestOptVal == 1
			OIDHarvestBodyMsgBox = AddTextOption("$CACOActivationType", "$CACOMessageBox")	
		else
			OIDHarvestBodyMsgBox = AddTextOption("$CACOActivationType", "$CACOAutomatic")	
		endif	

	elseif (page == "$CACOFarming")	
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("$CACOGardening")
		OIDGardenInitialTime = AddSliderOption("$CACOInitialGrowthTime", GardenInitialVal, "{0}")
		OIDGardenRegrowTime = AddSliderOption("$CACODaystoRegrow", GardenRegrowVal, "{0}")		
		OIDGardenFertilizerTime = AddSliderOption("$CACOFertilizerDuration", GardenFertilizerVal, "{0}")	
		OIDGardenFertilizerOption = AddTextOption("$CACOFertilizerEffect", FertilizerOptList[FertilizerOptVal])

		SetCursorPosition(1)		;start right-hand column
		AddHeaderOption("$CACOFarmingJobs")
		OIDJobFarmCabbage = AddSliderOption("$CACOCabbages", CACO_JobFarmCabbageAmt.GetValue(), "{0}")	
		OIDJobFarmGourd = AddSliderOption("$CACOSquash", CACO_JobFarmGourdAmt.GetValue(), "{0}")	
		OIDJobFarmLeek = AddSliderOption("$CACOLeeks", CACO_JobFarmLeekAmt.GetValue(), "{0}")	
		OIDJobFarmNirnroot = AddSliderOption("$CACONirnroot", CACO_JobFarmNirnrootAmt.GetValue(), "{0}")	
		OIDJobFarmPotato = AddSliderOption("$CACOPotatoes", CACO_JobFarmPotatoAmt.GetValue(), "{0}")	
		OIDJobFarmWheat = AddSliderOption("$CACOWheat", CACO_JobFarmWheatAmt.GetValue(), "{0}")			
		
	elseif (page == "$CACONeeds")
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)	
		AddHeaderOption("$CACOSleepOptions")
		OIDSleepChangesEnable = AddToggleOption("$CACORestrictRested",  CACO_SleepChangesEnabled.GetValue() as int)
		OIDSleepMinHours = AddSliderOption("$CACOMinRestedTime", MinHoursRestedVal, "{0} hrs")
		OIDSleepAllowWerewolf = AddToggleOption("$CACORestedWerewolves",  CACO_AllowWerewolfRested.GetValue() as int)
		AddEmptyOption()	
		AddHeaderOption("$CACOHunger&Fatigue")
		OIDBasicNeedsHungerEnable = AddToggleOption("$CACOHungerPenalties", CACO_BasicNeedsHungerEnabled.GetValue() as int)	
		if SleepChangeEnableVal == 0
			OIDBasicNeedsFatigueEnable = AddToggleOption("$CACOFatiguePenalties", CACO_BasicNeedsFatigueEnabled.GetValue() as int, OPTION_FLAG_DISABLED)
		else
			OIDBasicNeedsFatigueEnable = AddToggleOption("$CACOFatiguePenalties", CACO_BasicNeedsFatigueEnabled.GetValue() as int, OPTION_FLAG_NONE)	
		endif
		OIDBasicNeedsNotifications = AddTextOption("$CACONotificationMessages", NeedsList[NeedNotificationVal])		
		
	elseif (page == "$CACOHelp")
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)			
		AddHeaderOption("$CACOGeneralCompatibility")
		OIDMarkAsEaten = AddToggleOption("$CACOMarkHarvestedNPCs", CACO_OptionMarkAsEaten.GetValue() as int)		
		OIDCookingCombinePortions = AddToggleOption("$CACORecombinePortions",  CACO_OptionCombinePortions.GetValue() as int)
		OIDDisableWorkbenchOptions = AddToggleOption("$CACODisableAlchemyLab",  CACO_OptionDisableWorkbenchChanges.GetValue() as int)	
		OIDDisableChurnOptions = AddToggleOption("$CACODisableChurn",  CACO_OptionDisableChurnChanges.GetValue() as int)		
		OIDSwapItems = AddToggleOption("$CACODisableItemSwap", CACOIgnoreIngAddition_KRY.GetValue() as int)
		If CACOIgnoreIngAddition_KRY.GetValue() == 1
			OIDSwapSoulHusk = AddTextOption("$CACOSwapSoulHusks", "")
			OIDSwapHorkerTusk = AddTextOption("$CACOSwapHorkerTusks", "")
			OIDSwapDragonScales = AddTextOption("$CACOSwapHeartscales", "")
			OIDSwapHumanFlesh = AddTextOption("$CACOSwapHumanFlesh", "")
			OIDSwapBoneHawkClaw = AddTextOption("$CACOSwapBoneHawkClaws", "")
			OIDSwapBoneHawkFeather = AddTextOption("$CACOSwapBoneHawkFeathers", "")
			OIDSwapSkeeverHide = AddTextOption("$CACOSwapSkeeverHide", "")
			OIDSwapScalpel = AddTextOption("$CACOSwapScalpel", "")	
		endif
		AddEmptyOption()
		AddHeaderOption("$CACOiNeedCompatibility")		
		if CACO_ModiNeedInst.GetValue() == 1
			OIDUpdateiNeedLists = AddTextOption("$CACOUpdateiNeedLists", "", OPTION_FLAG_NONE)	
		else
			OIDUpdateiNeedLists = AddTextOption("$CACOUpdateiNeedLists", "", OPTION_FLAG_DISABLED)	
		endif

		SetCursorPosition(1)		;start right-hand column
		AddHeaderOption("$CACOTroubleshooting")	
		OIDPotionWeights = AddTextOption("$CACOUpdatePotionWeights", "")
		OIDRagdollParalysis = AddToggleOption("$CACORagdollParalysis", CACO_OptionRagdollParalysis.GetValue() as int)
		OIDStopAnimations = AddTextOption("$CACOStopDrunkenAnimations", "")
		AddEmptyOption()
		AddHeaderOption("$CACOForTesting")	
		OIDAddIngr = AddTextOption("$CACOGiveIngredients", "")
		OIDLearnEffects = AddTextOption("$CACOLearnAllEffects", "")
		OIDAddFoods = AddTextOption("$CACOGiveNewFood", "")
		OIDAddTools = AddTextOption("$CACOGiveNewTools", "")				
	Endif
EndEvent


Event OnOptionSelect(int option)
	If (option == OIDAdditionalMinIngr)
		if AdjustedMinVal == 0
			SetTextOptionValue(option, "$CACOAdjusted")
			AdjustedMinVal = 1.0
			CACOExtraIngrMin_KRY.setValue(0)
		else
			SetTextOptionValue(option, "$CACOVanilla")
			AdjustedMinVal = 0.0
			CACOExtraIngrMin_KRY.setValue(100)
		endif	
	elseif (option == OIDAdditionalMinMeat)
		if AdjustedMinMeatVal == 0
			SetTextOptionValue(option, "$CACOAdjusted")
			AdjustedMinMeatVal = 1.0
			CACOExtraMeatMin_KRY.setValue(0)
		else
			SetTextOptionValue(option, "$CACOVanilla")
			AdjustedMinMeatVal = 0.0
			CACOExtraMeatMin_KRY.setValue(100)
		endif		
	elseif (option == OIDAddIngr)
		Game.GetPlayer().Additem(CACO_AllIngredients, 10, true)
	elseif (option == OIDAddFoods)
		Game.GetPlayer().Additem(CACO_AllFood, 1, true)
	elseif (option == OIDAddTools)
		Game.GetPlayer().Additem(CACO_AllTools, 1, true)
	elseif (option == OIDLearnEffects)
		if ShowMessage("$CACOMsgRevealEffects", true, "$CACOContinue", "$CACOCancel")
			RevealAllEffects()
		Endif	
	elseif (option == OIDPotionWeights)
		if ShowMessage("$CACOMsgPotionWeight", true, "$CACOContinue", "$CACOCancel")
			PotionMaintenance()
			ForcePageReset()
		endif	
	elseif (option == OIDUpdateiNeedLists)
		if ShowMessage("$CACOMsgUpdateiNeed", true, "$CACOContinue", "$CACOCancel")
			CACOQuest.UpdateiNeedFoodCompatibility()
		endif
		ForcePageReset()
	elseif (option == OIDStopAnimations)
		PlayerRef.playidle(DrunkStop)
		Utility.Wait(2)
		PlayerRef.playidle(ForceDefaultState)		
		ForcePageReset()	
	elseif (option == OIDSwapItems)
		if CACOIgnoreIngAddition_KRY.GetValue() == 1
			CACOIgnoreIngAddition_KRY.SetValue(0)
		else
			CACOIgnoreIngAddition_KRY.SetValue(1)
		endif
		ForcePageReset()
	elseif (option == OIDSwapSoulHusk)
		SwapSoulHusk()
		ForcePageReset()
	elseif (option == OIDSwapHorkerTusk)
		SwapHorkerTusk()
		ForcePageReset()
	elseif (option == OIDSwapDragonScales)
		SwapHeartScales()
		ForcePageReset()
	elseif (option == OIDSwapHumanFlesh)
		SwapHumanFlesh()
		ForcePageReset()
	elseif (option == OIDSwapSkeeverHide)
		SwapSkeeverHide()
		ForcePageReset()		
	elseif (option == OIDSwapBoneHawkClaw)
		SwapBoneHawkClaw()
		ForcePageReset()
	elseif (option == OIDSwapBoneHawkFeather)
		SwapBoneHawkFeather()
		ForcePageReset()	
	elseif (option == OIDSwapScalpel)
		SwapScalpel()
		ForcePageReset()			
	elseif  (option == OIDHealthDur)
		AdvChoice(HealthDurVal)
		HealthDurVal = currentval
		CACO_RestoreHealthDuration.SetValue(currentval)
		ChangeIngredientDuration(CACO_RestoreIngH1st, 0, currentval, 0)
		ChangeIngredientDuration(CACO_RestoreIngH2nd, 1, currentval, 0)
		ChangeIngredientDuration(CACO_RestoreIngH3rd, 2, currentval, 0)
		ChangeIngredientDuration(CACO_RestoreIngH4th, 3, currentval, 0)
		FixIngConsumeFunction() ;schofida - set ingr magnitude for first effect (for eating)
		if currentval == 0
			AlchRestoreHealth_1sec.ClearEffectFlag(0x00008000)
			AlchRestoreHealth_5sec.SetEffectFlag(0x00008000)		
			AlchRestoreHealth_10sec.SetEffectFlag(0x00008000)
			AlchRestoreHealthBlood_1sec.ClearEffectFlag(0x00008000)
			AlchRestoreHealthBlood_5sec.SetEffectFlag(0x00008000)		
			AlchRestoreHealthBlood_10sec.SetEffectFlag(0x00008000)			
		elseif currentval == 1
			AlchRestoreHealth_1sec.SetEffectFlag(0x00008000)
			AlchRestoreHealth_5sec.ClearEffectFlag(0x00008000)		
			AlchRestoreHealth_10sec.SetEffectFlag(0x00008000)
			AlchRestoreHealthBlood_1sec.SetEffectFlag(0x00008000)
			AlchRestoreHealthBlood_5sec.ClearEffectFlag(0x00008000)		
			AlchRestoreHealthBlood_10sec.SetEffectFlag(0x00008000)
		else
			AlchRestoreHealth_1sec.SetEffectFlag(0x00008000)
			AlchRestoreHealth_5sec.SetEffectFlag(0x00008000)		
			AlchRestoreHealth_10sec.ClearEffectFlag(0x00008000)
			AlchRestoreHealthBlood_1sec.SetEffectFlag(0x00008000)
			AlchRestoreHealthBlood_5sec.SetEffectFlag(0x00008000)		
			AlchRestoreHealthBlood_10sec.ClearEffectFlag(0x00008000)			
		endif
		(AdjustPotionQuest as CACO_AdjustPotionThread).RestHpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread01).RestHpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread02).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread03).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread04).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread05).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread06).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread07).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread08).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread09).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread10).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread11).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread12).RestHpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread13).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread14).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread15).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread16).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread17).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread18).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread19).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread20).RestHpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread21).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread22).RestHpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread23).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread24).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread25).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread26).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread27).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread28).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread29).RestHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread30).RestHpos = currentval	
		SetTextOptionValue(OIDHealthDur, DurationList[HealthDurVal])	
	elseif  (option == OIDStaminaDur)
		AdvChoice(StaminaDurVal)
		StaminaDurVal = currentval
		CACO_RestoreStaminaDuration.SetValue(currentval)
		ChangeIngredientDuration(CACO_RestoreIngS1st, 0, currentval, 0)
		ChangeIngredientDuration(CACO_RestoreIngS2nd, 1, currentval, 0)
		ChangeIngredientDuration(CACO_RestoreIngS3rd, 2, currentval, 0)
		ChangeIngredientDuration(CACO_RestoreIngS4th, 3, currentval, 0)
		FixIngConsumeFunction() ;schofida - set ingr magnitude for first effect (for eating)
		if currentval == 0
			AlchRestoreStamina_1sec.ClearEffectFlag(0x00008000)
			AlchRestoreStamina_5sec.SetEffectFlag(0x00008000)		
			AlchRestoreStamina_10sec.SetEffectFlag(0x00008000)
		elseif currentval == 1
			AlchRestoreStamina_1sec.SetEffectFlag(0x00008000)
			AlchRestoreStamina_5sec.ClearEffectFlag(0x00008000)		
			AlchRestoreStamina_10sec.SetEffectFlag(0x00008000)
		else
			AlchRestoreStamina_1sec.SetEffectFlag(0x00008000)
			AlchRestoreStamina_5sec.SetEffectFlag(0x00008000)		
			AlchRestoreStamina_10sec.ClearEffectFlag(0x00008000)
		endif
		(AdjustPotionQuest as CACO_AdjustPotionThread).RestSpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread01).RestSpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread02).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread03).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread04).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread05).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread06).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread07).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread08).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread09).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread10).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread11).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread12).RestSpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread13).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread14).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread15).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread16).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread17).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread18).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread19).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread20).RestSpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread21).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread22).RestSpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread23).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread24).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread25).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread26).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread27).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread28).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread29).RestSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread30).RestSpos = currentval			
		SetTextOptionValue(OIDStaminaDur, DurationList[StaminaDurVal])	
	elseif  (option == OIDMagickaDur)
		AdvChoice(MagickaDurVal)
		MagickaDurVal = currentval
		CACO_RestoreMagickaDuration.SetValue(currentval)
		ChangeIngredientDuration(CACO_RestoreIngM1st, 0, currentval, 0)
		ChangeIngredientDuration(CACO_RestoreIngM2nd, 1, currentval, 0)
		ChangeIngredientDuration(CACO_RestoreIngM3rd, 2, currentval, 0)
		ChangeIngredientDuration(CACO_RestoreIngM4th, 3, currentval, 0)
		FixIngConsumeFunction() ;schofida - set ingr magnitude for first effect (for eating)
		if currentval == 0
			AlchRestoreMagicka_1sec.ClearEffectFlag(0x00008000)
			AlchRestoreMagicka_5sec.SetEffectFlag(0x00008000)		
			AlchRestoreMagicka_10sec.SetEffectFlag(0x00008000)
		elseif currentval == 1
			AlchRestoreMagicka_1sec.SetEffectFlag(0x00008000)
			AlchRestoreMagicka_5sec.ClearEffectFlag(0x00008000)		
			AlchRestoreMagicka_10sec.SetEffectFlag(0x00008000)
		else
			AlchRestoreMagicka_1sec.SetEffectFlag(0x00008000)
			AlchRestoreMagicka_5sec.SetEffectFlag(0x00008000)		
			AlchRestoreMagicka_10sec.ClearEffectFlag(0x00008000)
		endif
		(AdjustPotionQuest as CACO_AdjustPotionThread).RestMpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread01).RestMpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread02).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread03).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread04).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread05).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread06).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread07).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread08).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread09).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread10).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread11).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread12).RestMpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread13).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread14).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread15).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread16).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread17).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread18).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread19).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread20).RestMpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread21).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread22).RestMpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread23).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread24).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread25).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread26).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread27).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread28).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread29).RestMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread30).RestMpos = currentval		
		SetTextOptionValue(OIDMagickaDur, DurationList[MagickaDurVal])	
	elseif  (option == OIDHealthDamDur)
		AdvChoice(HealthDamVal)
		HealthDamVal = currentval
		CACO_DamageHealthDuration.SetValue(currentval)
		ChangeIngredientDuration(CACO_DamageIngH1st, 0, currentval, 1)
		ChangeIngredientDuration(CACO_DamageIngH2nd, 1, currentval, 1)
		ChangeIngredientDuration(CACO_DamageIngH3rd, 2, currentval, 1)
		ChangeIngredientDuration(CACO_DamageIngH4th, 3, currentval, 1)
		if currentval == 0
			AlchDamageHealth_1sec.ClearEffectFlag(0x00008000)
			AlchDamageHealth_5sec.SetEffectFlag(0x00008000)		
			AlchDamageHealth_10sec.SetEffectFlag(0x00008000)
			AlchDamageUndead_1sec.ClearEffectFlag(0x00008000)
			AlchDamageUndead_5sec.SetEffectFlag(0x00008000)		
			AlchDamageUndead_10sec.SetEffectFlag(0x00008000)
		elseif currentval == 1
			AlchDamageHealth_1sec.SetEffectFlag(0x00008000)
			AlchDamageHealth_5sec.ClearEffectFlag(0x00008000)		
			AlchDamageHealth_10sec.SetEffectFlag(0x00008000)
			AlchDamageUndead_1sec.SetEffectFlag(0x00008000)
			AlchDamageUndead_5sec.ClearEffectFlag(0x00008000)		
			AlchDamageUndead_10sec.SetEffectFlag(0x00008000)
		else
			AlchDamageHealth_1sec.SetEffectFlag(0x00008000)
			AlchDamageHealth_5sec.SetEffectFlag(0x00008000)		
			AlchDamageHealth_10sec.ClearEffectFlag(0x00008000)
			AlchDamageUndead_1sec.SetEffectFlag(0x00008000)
			AlchDamageUndead_5sec.SetEffectFlag(0x00008000)		
			AlchDamageUndead_10sec.ClearEffectFlag(0x00008000)
		endif
		(AdjustPotionQuest as CACO_AdjustPotionThread).DamHpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread01).DamHpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread02).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread03).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread04).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread05).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread06).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread07).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread08).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread09).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread10).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread11).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread12).DamHpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread13).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread14).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread15).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread16).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread17).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread18).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread19).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread20).DamHpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread21).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread22).DamHpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread23).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread24).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread25).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread26).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread27).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread28).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread29).DamHpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread30).DamHpos = currentval		
		SetTextOptionValue(OIDHealthDamDur, DurationDamList[HealthDamVal])	
	elseif  (option == OIDStaminaDamDur)
		AdvChoice(StaminaDamVal)
		StaminaDamVal = currentval
		CACO_DamageStaminaDuration.SetValue(currentval)
		ChangeIngredientDuration(CACO_DamageIngS1st, 0, currentval, 1)
		ChangeIngredientDuration(CACO_DamageIngS2nd, 1, currentval, 1)
		ChangeIngredientDuration(CACO_DamageIngS3rd, 2, currentval, 1)
		ChangeIngredientDuration(CACO_DamageIngS4th, 3, currentval, 1)
		if currentval == 0
			AlchDamageStamina_1sec.ClearEffectFlag(0x00008000)
			AlchDamageStamina_5sec.SetEffectFlag(0x00008000)		
			AlchDamageStamina_10sec.SetEffectFlag(0x00008000)
		elseif currentval == 1
			AlchDamageStamina_1sec.SetEffectFlag(0x00008000)
			AlchDamageStamina_5sec.ClearEffectFlag(0x00008000)		
			AlchDamageStamina_10sec.SetEffectFlag(0x00008000)
		else
			AlchDamageStamina_1sec.SetEffectFlag(0x00008000)
			AlchDamageStamina_5sec.SetEffectFlag(0x00008000)		
			AlchDamageStamina_10sec.ClearEffectFlag(0x00008000)
		endif
		(AdjustPotionQuest as CACO_AdjustPotionThread).DamSpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread01).DamSpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread02).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread03).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread04).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread05).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread06).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread07).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread08).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread09).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread10).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread11).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread12).DamSpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread13).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread14).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread15).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread16).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread17).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread18).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread19).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread20).DamSpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread21).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread22).DamSpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread23).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread24).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread25).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread26).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread27).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread28).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread29).DamSpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread30).DamSpos = currentval
		SetTextOptionValue(OIDStaminaDamDur, DurationDamList[StaminaDamVal])	
	elseif  (option == OIDMagickaDamDur)
		AdvChoice(MagickaDamVal)
		MagickaDamVal = currentval
		CACO_DamageMagickaDuration.SetValue(currentval)
		ChangeIngredientDuration(CACO_DamageIngM1st, 0, currentval, 1)
		ChangeIngredientDuration(CACO_DamageIngM2nd, 1, currentval, 1)
		ChangeIngredientDuration(CACO_DamageIngM3rd, 2, currentval, 1)
		ChangeIngredientDuration(CACO_DamageIngM4th, 3, currentval, 1)
		if currentval == 0
			AlchDamageMagicka_1sec.ClearEffectFlag(0x00008000)
			AlchDamageMagicka_5sec.SetEffectFlag(0x00008000)		
			AlchDamageMagicka_10sec.SetEffectFlag(0x00008000)
		elseif currentval == 1
			AlchDamageMagicka_1sec.SetEffectFlag(0x00008000)
			AlchDamageMagicka_5sec.ClearEffectFlag(0x00008000)		
			AlchDamageMagicka_10sec.SetEffectFlag(0x00008000)
		else
			AlchDamageMagicka_1sec.SetEffectFlag(0x00008000)
			AlchDamageMagicka_5sec.SetEffectFlag(0x00008000)		
			AlchDamageMagicka_10sec.ClearEffectFlag(0x00008000)
		endif
		(AdjustPotionQuest as CACO_AdjustPotionThread).DamMpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread01).DamMpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread02).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread03).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread04).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread05).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread06).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread07).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread08).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread09).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread10).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread11).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread12).DamMpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread13).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread14).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread15).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread16).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread17).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread18).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread19).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread20).DamMpos = currentval	
		(AdjustPotionQuest as CACO_AdjustPotionThread21).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread22).DamMpos = currentval
		(AdjustPotionQuest as CACO_AdjustPotionThread23).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread24).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread25).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread26).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread27).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread28).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread29).DamMpos = currentval		
		(AdjustPotionQuest as CACO_AdjustPotionThread30).DamMpos = currentval		
		SetTextOptionValue(OIDMagickaDamDur, DurationDamList[MagickaDamVal])	
	elseif  (option == OIDVampireRestoreHealth)
		if  CACO_NoRestoreHealthForVampires.GetValue() == 1
			 CACO_NoRestoreHealthForVampires.SetValue(0)
		else
			 CACO_NoRestoreHealthForVampires.SetValue(1)
		endif
		ForcePageReset()	
	elseif  (option == OIDRequireMortar)
		if  CACO_RequireMortarToUseLab.GetValue() == 1
			 CACO_RequireMortarToUseLab.SetValue(0)
		else
			 CACO_RequireMortarToUseLab.SetValue(1)
		endif
		ForcePageReset()
	elseif  (option == OIDWaterWellEnable)
		if  CACO_WellActivatorEnabled.GetValue() == 1
			 CACO_WellActivatorEnabled.SetValue(0)
		else
			 CACO_WellActivatorEnabled.SetValue(1)
		endif
		ForcePageReset()		
	elseif  (option == OIDWaterWellBucket)
		if  CACO_WellActivatorRequireBucket.GetValue() == 1
			 CACO_WellActivatorRequireBucket.SetValue(0)
		else
			 CACO_WellActivatorRequireBucket.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDBasicNeedsHungerEnable)
		if  CACO_BasicNeedsHungerEnabled.GetValue() == 1
			CACO_BasicNeedsHungerEnabled.SetValue(0)
		else
			CACO_BasicNeedsHungerEnabled.SetValue(1)
		endif
		ForcePageReset()				
	elseif  (option == OIDBasicNeedsFatigueEnable)
		if  CACO_BasicNeedsFatigueEnabled.GetValue() == 1
			CACO_BasicNeedsFatigueEnabled.SetValue(0)
		else
			CACO_BasicNeedsFatigueEnabled.SetValue(1)
			Game.GetPlayer().EquipItem(RestedPotion, false, true)
		endif
		ForcePageReset()		
	elseif  (option == OIDSleepChangesEnable)
		if  CACO_SleepChangesEnabled.GetValue() == 1
			 CACO_SleepChangesEnabled.SetValue(0)
			 CACO_BasicNeedsFatigueEnabled.SetValue(0)
			SleepChangeEnableVal = 0
		else
			 CACO_SleepChangesEnabled.SetValue(1)
			 SleepChangeEnableVal = 1
		endif
		ForcePageReset()	
	elseif  (option == OIDSleepAllowWerewolf)
		if  CACO_AllowWerewolfRested.GetValue() == 1
			 CACO_AllowWerewolfRested.SetValue(0)
		else
			 CACO_AllowWerewolfRested.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDCraftFreeWater)
		if  CACO_FoodCraftFreeWater.GetValue() == 1
			 CACO_FoodCraftFreeWater.SetValue(0)
		else
			 CACO_FoodCraftFreeWater.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDCookingNewRecipes)
		if  CACO_CACOAddedRecipes.GetValue() == 1
			 CACO_CACOAddedRecipes.SetValue(0)
		else
			 CACO_CACOAddedRecipes.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDCookingInventoryCond)
		if  CACO_OptionDeclutterCraftingMenu.GetValue() == 1
			 CACO_OptionDeclutterCraftingMenu.SetValue(0)
		else
			 CACO_OptionDeclutterCraftingMenu.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDAlchemyInventoryCond)
		if  CACO_OptionDeclutterAlchemyMenu.GetValue() == 1
			 CACO_OptionDeclutterAlchemyMenu.SetValue(0)
		else
			 CACO_OptionDeclutterAlchemyMenu.SetValue(1)
		endif
		ForcePageReset()		
	elseif  (option == OIDRecipesTeachEffects)
		if  CACO_OptionNotesLearnEffects.GetValue() == 1
			 CACO_OptionNotesLearnEffects.SetValue(0)
		else
			 CACO_OptionNotesLearnEffects.SetValue(1)
		endif
		ForcePageReset()				
	elseif  (option == OIDBombNotifications)
		if  CACO_OptionBombNotifications.GetValue() == 1
			 CACO_OptionBombNotifications.SetValue(0)
		else
			 CACO_OptionBombNotifications.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDLoadScreens)
		if  CACO_LoadScreens.GetValue() == 1
			 CACO_LoadScreens.SetValue(0)
		else
			 CACO_LoadScreens.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDXPNotifications)
		if  CACO_OptionCookingXPNotifications.GetValue() == 1
			 CACO_OptionCookingXPNotifications.SetValue(0)
		else
			 CACO_OptionCookingXPNotifications.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDHarvestFlesh)
		AdvChoice(FleshOptVal)
		FleshOptVal = currentval
		if FleshOptVal == 0
			CACO_OptionCannibalism.SetValue(0)
			CACO_OptionDisableHarvestFlesh.SetValue(0)
		elseif FleshOptVal == 1
			CACO_OptionCannibalism.SetValue(1)
			CACO_OptionDisableHarvestFlesh.SetValue(0)
		else
			CACO_OptionCannibalism.SetValue(0)
			CACO_OptionDisableHarvestFlesh.SetValue(1)
		endif				
		SetTextOptionValue(OIDHarvestFlesh, FleshOptList[FleshOptVal])		
	elseif  (option == OIDMilkCows)
		AdvChoice(MilkOptVal)
		MilkOptVal = currentval
		if MilkOptVal == 0
			CACO_OptionMilkCows.SetValue(1)
			CACO_OptionMilkCowsPlayerOnly.SetValue(1)
		elseif MilkOptVal == 1
			CACO_OptionMilkCows.SetValue(1)
			CACO_OptionMilkCowsPlayerOnly.SetValue(0)
		else
			CACO_OptionMilkCows.SetValue(0)
		endif				
		SetTextOptionValue(OIDMilkCows, MilkOptList[MilkOptVal])		
	elseif  (option == OIDMarkAsEaten)
		if  CACO_OptionMarkAsEaten.GetValue() == 1
			 CACO_OptionMarkAsEaten.SetValue(0)
		else
			CACO_OptionMarkAsEaten.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDRagdollParalysis)
		if  CACO_OptionRagdollParalysis.GetValue() == 1
			 CACO_OptionRagdollParalysis.SetValue(0)
		else
			CACO_OptionRagdollParalysis.SetValue(1)
		endif
		ChangeParalysisEffects()
		ForcePageReset()				
	elseif  (option == OIDCookingCombinePortions)
		if  CACO_OptionCombinePortions.GetValue() == 1
			 CACO_OptionCombinePortions.SetValue(0)
		else
			CACO_OptionCombinePortions.SetValue(1)
		endif
		ForcePageReset()		
	elseif  (option == OIDDisableWorkbenchOptions)
		if  CACO_OptionDisableWorkbenchChanges.GetValue() == 1
			 CACO_OptionDisableWorkbenchChanges.SetValue(0)
		else
			CACO_OptionDisableWorkbenchChanges.SetValue(1)
		endif
		ForcePageReset()	
	elseif  (option == OIDDisableChurnOptions)
		if  CACO_OptionDisableChurnChanges.GetValue() == 1
			 CACO_OptionDisableChurnChanges.SetValue(0)
		else
			CACO_OptionDisableChurnChanges.SetValue(1)
		endif
		ForcePageReset()		
	elseif  (option == OIDToggleDistillPotionRecipes)
		if  CACO_OptionDistillPotions.GetValue() == 1
			 CACO_OptionDistillPotions.SetValue(0)
		else
			CACO_OptionDistillPotions.SetValue(1)
		endif
		ForcePageReset()		
	elseif  (option == OIDRenamePotions)
		if  CACORenamePotionOption_KRY.GetValue() == 1
			CACORenamePotionOption_KRY.SetValue(0)
		else
			CACORenamePotionOption_KRY.SetValue(1)
		endif
		Int RenameOpt = CACORenamePotionOption_KRY.GetValue() as int
		(AdjustPotionQuest as CACO_AdjustPotionThread).RenameOption = RenameOpt
		(AdjustPotionQuest as CACO_AdjustPotionThread01).RenameOption = RenameOpt	
		(AdjustPotionQuest as CACO_AdjustPotionThread02).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread03).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread04).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread05).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread06).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread07).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread08).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread09).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread10).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread11).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread12).RenameOption = RenameOpt
		(AdjustPotionQuest as CACO_AdjustPotionThread13).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread14).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread15).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread16).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread17).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread18).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread19).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread20).RenameOption = RenameOpt	
		(AdjustPotionQuest as CACO_AdjustPotionThread21).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread22).RenameOption = RenameOpt
		(AdjustPotionQuest as CACO_AdjustPotionThread23).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread24).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread25).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread26).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread27).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread28).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread29).RenameOption = RenameOpt		
		(AdjustPotionQuest as CACO_AdjustPotionThread30).RenameOption = RenameOpt		
		ForcePageReset()
	elseif  (option == OIDStackableEffects)
		if  EffectsDontStackVal == 1
			 EffectsDontStackVal = 0
		else
			 EffectsDontStackVal = 1
		endif
		ChangeStackablePotions(CACO_StackableHealthEffects, "Health", MagicAlchRestoreHealth)
		ChangeStackablePotions(CACO_StackableMagickaEffects, "Magicka", MagicAlchRestoreMagicka)
		ChangeStackablePotions(CACO_StackableStaminaEffects, "Stamina", MagicAlchRestoreStamina)
		ForcePageReset()
	elseif  (option == OIDFoodFrequency)		
		AdvFoodChoice(FoodFreqVal)
		FoodFreqVal = currentval
		if currentval == 0
			CACO_FoodBarrelChance.SetValue(30)
			CACO_FoodBarrelDefault100Chance.SetValue(0)
			CACO_FoodSackChance.SetValue(30)
			CACO_FoodSackDefault100Chance.SetValue(0)
		elseif currentval == 1
			CACO_FoodBarrelChance.SetValue(55)
			CACO_FoodBarrelDefault100Chance.SetValue(35)
			CACO_FoodSackChance.SetValue(55)
			CACO_FoodSackDefault100Chance.SetValue(35)			
		elseif currentval == 2
			CACO_FoodBarrelChance.SetValue(80)
			CACO_FoodBarrelDefault100Chance.SetValue(70)
			CACO_FoodSackChance.SetValue(80)
			CACO_FoodSackDefault100Chance.SetValue(70)				
		else
			CACO_FoodBarrelChance.SetValue(100)
			CACO_FoodBarrelDefault100Chance.SetValue(100)
			CACO_FoodSackChance.SetValue(100)
			CACO_FoodSackDefault100Chance.SetValue(100)			
		endif
		SetTextOptionValue(OIDFoodFrequency, FoodFrequencyList[FoodFreqVal])	
	elseif  (option == OIDFoodQuantity)		
		AdvFoodChoice(FoodQuantVal)
		FoodQuantVal = currentval
		if currentval == 0
			CACO_ExtraFoodChance.SetValue(25)
			CACO_ExtraFoodSpecial25Chance.SetValue(75)
		elseif currentval == 1
			CACO_ExtraFoodChance.SetValue(50)
			CACO_ExtraFoodSpecial25Chance.SetValue(80)			
		elseif currentval == 2
			CACO_ExtraFoodChance.SetValue(75)
			CACO_ExtraFoodSpecial25Chance.SetValue(90)				
		else
			CACO_ExtraFoodChance.SetValue(100)
			CACO_ExtraFoodSpecial25Chance.SetValue(100)			
		endif
		SetTextOptionValue(OIDFoodQuantity, FoodQuantityList[FoodQuantVal])	
	elseif  (option == OIDGardenFertilizerOption)		
		AdvChoice(FertilizerOptVal)
		FertilizerOptVal = currentval
		CACO_OptionFertilizerEffect.SetValue(currentval)
		SetTextOptionValue(OIDGardenFertilizerOption, FertilizerOptList[FertilizerOptVal])		
	elseif  (option == OIDDeadlyVenom)		
		AdvChoice(VenomVal)
		VenomVal = currentval
		CACO_VenomDamageLevel.SetValue(currentval)
		SetTextOptionValue(OIDDeadlyVenom, DifficultyList[VenomVal])	
	elseif  (option == OIDHarvestBodyMsgBox)	
		if HarvestOptVal == 0
			SetTextOptionValue(option, "$CACOMessageBox")
			HarvestOptVal = 1
			CACO_OptionHarvestBodyMsgBox.SetValue(1)
			if Game.GetPlayer().HasPerk(CACO_AnatomistPerk)
				Game.GetPlayer().RemovePerk(CACO_HarvestBloodPerk)
				Game.GetPlayer().AddPerk(CACO_HarvestBloodPerkMsgBox)
			endif	
		else
			SetTextOptionValue(option, "$CACOAutomatic")
			HarvestOptVal = 0
			CACO_OptionHarvestBodyMsgBox.SetValue(0)
			if Game.GetPlayer().HasPerk(CACO_AnatomistPerk)
				Game.GetPlayer().AddPerk(CACO_HarvestBloodPerk)
				Game.GetPlayer().RemovePerk(CACO_HarvestBloodPerkMsgBox)	
			endif	
		endif	
	elseif  (option == OIDBasicNeedsNotifications)		
		AdvChoice(NeedNotificationVal)
		NeedNotificationVal = currentval
		CACO_BasicNeedsNotifications.SetValue(currentval)
		SetTextOptionValue(OIDBasicNeedsNotifications, NeedsList[NeedNotificationVal])			
	elseif (option == OIDCookingXPEnabled)	
		if CACO_PlayerCookingXPEnabled.GetValue() == 0
			CACO_PlayerCookingXPEnabled.SetValue(1)
			CookingXPVal = 1
		else
			CACO_PlayerCookingXPEnabled.SetValue(0)
			CookingXPVal = 0
		endif		
		forcepagereset()		
	elseif  (option == OIDDrunkAnimations)
		if  CACO_AlcoholDrunkAnimations.GetValue() == 1
			 CACO_AlcoholDrunkAnimations.SetValue(0)
		else
			 CACO_AlcoholDrunkAnimations.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDDrunkVisuals)
		if  CACO_AlcoholDrunkVisuals.GetValue() == 1
			 CACO_AlcoholDrunkVisuals.SetValue(0)
		else
			 CACO_AlcoholDrunkVisuals.SetValue(1)
		endif
		ForcePageReset()		
	elseif  (option == OIDDrunkMessages)
		if  CACO_AlcoholDrunkMessages.GetValue() == 1
			 CACO_AlcoholDrunkMessages.SetValue(0)
		else
			 CACO_AlcoholDrunkMessages.SetValue(1)
		endif
		ForcePageReset()			
	elseif  (option == OIDCurrentCookingRank)
		if  CACO_PlayerCookingSkillRank.GetValue() == 0
			ShowMessage("$CACOMsgCookingSkill_Novice", true, "$CACOOkay")
		elseif  CACO_PlayerCookingSkillRank.GetValue() == 1
			ShowMessage("$CACOMsgCookingSkill_Apprentice", true, "$CACOOkay")
		elseif  CACO_PlayerCookingSkillRank.GetValue() == 2
			ShowMessage("$CACOMsgCookingSkill_Adept", true, "$CACOOkay")
		elseif  CACO_PlayerCookingSkillRank.GetValue() == 3
			ShowMessage("$CACOMsgCookingSkill_Expert", true, "$CACOOkay")
		elseif  CACO_PlayerCookingSkillRank.GetValue() == 4
			ShowMessage("$CACOMsgCookingSkill_Master", true, "$CACOOkay")
		endif	
	Endif
EndEvent

event OnOptionSliderOpen(int option)
	if (option == OIDExtraIngrPrePerkChance)
		SetSliderDialogStartValue(ExtraIngrPrePerkVal)
		SetSliderDialogDefaultValue(30)
		SetSliderDialogRange(0, 50)
		SetSliderDialogInterval(5)
	elseIf (option == OIDExtraIngrPostPerkChance)
		SetSliderDialogStartValue(ExtraIngrPostPerkVal)
		SetSliderDialogDefaultValue(60)
		SetSliderDialogRange(50, 100)
		SetSliderDialogInterval(5)
	elseif (option == OIDAlchemyXPRate)
		SetSliderDialogStartValue(AlchXPMultVal)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0, 2.0)
		SetSliderDialogInterval(0.05)	
	elseIf (option == OIDGardenInitialTime)
		SetSliderDialogStartValue(GardenInitialVal)
		SetSliderDialogDefaultValue(3)
		SetSliderDialogRange(3, 30)
		SetSliderDialogInterval(1)		
	elseIf (option == OIDGardenRegrowTime)
		SetSliderDialogStartValue(GardenRegrowVal)
		SetSliderDialogDefaultValue(3)
		SetSliderDialogRange(3, 30)
		SetSliderDialogInterval(1)		
	elseIf (option == OIDGardenFertilizerTime)
		SetSliderDialogStartValue(GardenFertilizerVal)
		SetSliderDialogDefaultValue(30)
		SetSliderDialogRange(15, 180)
		SetSliderDialogInterval(1)				
	elseIf (option == OIDJobFarmCabbage)
		SetSliderDialogStartValue(CACO_JobFarmCabbageAmt.GetValue())
		SetSliderDialogDefaultValue(5)
		SetSliderDialogRange(1, 20)
		SetSliderDialogInterval(1)
	elseIf (option == OIDJobFarmGourd)
		SetSliderDialogStartValue(CACO_JobFarmGourdAmt.GetValue())
		SetSliderDialogDefaultValue(10)
		SetSliderDialogRange(1, 20)
		SetSliderDialogInterval(1)
	elseIf (option == OIDJobFarmLeek)
		SetSliderDialogStartValue(CACO_JobFarmLeekAmt.GetValue())
		SetSliderDialogDefaultValue(5)
		SetSliderDialogRange(1, 20)
		SetSliderDialogInterval(1)
	elseIf (option == OIDJobFarmNirnroot)
		SetSliderDialogStartValue(CACO_JobFarmNirnrootAmt.GetValue())
		SetSliderDialogDefaultValue(5)
		SetSliderDialogRange(1, 20)
		SetSliderDialogInterval(1)
	elseIf (option == OIDJobFarmPotato)
		SetSliderDialogStartValue(CACO_JobFarmPotatoAmt.GetValue())
		SetSliderDialogDefaultValue(10)
		SetSliderDialogRange(1, 20)
		SetSliderDialogInterval(1)
	elseIf (option == OIDJobFarmWheat)
		SetSliderDialogStartValue(CACO_JobFarmWheatAmt.GetValue())
		SetSliderDialogDefaultValue(50)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)	
	elseif (option == OIDCookingXPMult)
		SetSliderDialogStartValue(XPMultVal)
		SetSliderDialogDefaultValue(3.0)
		SetSliderDialogRange(-5.0, 5.0)
		SetSliderDialogInterval(0.1)		
	elseif (option == OIDDrunkTolerance)
		SetSliderDialogStartValue(ToleranceVal)
		SetSliderDialogDefaultValue(5)
		SetSliderDialogRange(1, 10)
		SetSliderDialogInterval(1)		
	elseif (option == OIDSleepMinHours)
		SetSliderDialogStartValue(MinHoursRestedVal)
		SetSliderDialogDefaultValue(6)
		SetSliderDialogRange(1, 8)
		SetSliderDialogInterval(1)				
	endif
endevent

Event OnOptionSliderAccept(int option, float value)
	if (option == OIDExtraIngrPrePerkChance)
		ExtraIngrPrePerkVal = value
		SetSliderOptionValue(OIDExtraIngrPrePerkChance, ExtraIngrPrePerkVal, "{0}%")
		CheckHarvestRates()
	elseIf (option == OIDExtraIngrPostPerkChance)
		ExtraIngrPostPerkVal = value
		SetSliderOptionValue(OIDExtraIngrPostPerkChance, ExtraIngrPostPerkVal, "{0}%")
		CACOExtraIngrChancePostPerk_KRY.SetValue((100 - ExtraIngrPostPerkVal) as int)
		CheckHarvestRates()
	elseIf (option == OIDGardenInitialTime)
		GardenInitialVal = value
		SetSliderOptionValue(OIDGardenInitialTime, GardenInitialVal, "{0}")
		CACO_GardenInitialGrowDays.SetValue(GardenInitialVal as int)
	elseIf (option == OIDGardenRegrowTime)
		GardenRegrowVal = value
		SetSliderOptionValue(OIDGardenRegrowTime, GardenRegrowVal, "{0}")
		CACO_GardenRegrowDays.SetValue(GardenRegrowVal as int)	
	elseIf (option == OIDGardenFertilizerTime)
		GardenFertilizerVal = value
		SetSliderOptionValue(OIDGardenFertilizerTime, GardenFertilizerVal, "{0}")
		CACO_GardenFertilizerDays.SetValue(GardenFertilizerVal as int)	
	elseif (option == OIDAlchemyXPRate)
		AlchXPMultVal = value
		if AlchXPMultVal == 1.0 && Game.GetPlayer().HasPerk(CACO_AlchXPRate)
			Game.GetPlayer().RemovePerk(CACO_AlchXPRate)
		elseif AlchXPMultVal != 1.0 && !Game.GetPlayer().HasPerk(CACO_AlchXPRate)
			Game.GetPlayer().AddPerk(CACO_AlchXPRate)
		endif
		SetSliderOptionValue(OIDAlchemyXPRate, AlchXPMultVal, "{1.00}")
		CACO_OptionAlchXPRate.SetValue(AlchXPMultVal as float)			
	elseIf (option == OIDJobFarmCabbage)
		CACO_JobFarmCabbageAmt.SetValue(value)
		SetSliderOptionValue(OIDJobFarmCabbage, CACO_JobFarmCabbageAmt.GetValue(), "{0}")
	elseIf (option == OIDJobFarmGourd)
		CACO_JobFarmGourdAmt.SetValue(value)
		SetSliderOptionValue(OIDJobFarmGourd, CACO_JobFarmGourdAmt.GetValue(), "{0}")	
	elseIf (option == OIDJobFarmLeek)
		CACO_JobFarmLeekAmt.SetValue(value)
		SetSliderOptionValue(OIDJobFarmLeek, CACO_JobFarmLeekAmt.GetValue(), "{0}")		
	elseIf (option == OIDJobFarmNirnroot)
		CACO_JobFarmNirnrootAmt.SetValue(value)
		SetSliderOptionValue(OIDJobFarmNirnroot, CACO_JobFarmNirnrootAmt.GetValue(), "{0}")	
	elseIf (option == OIDJobFarmPotato)
		CACO_JobFarmPotatoAmt.SetValue(value)
		SetSliderOptionValue(OIDJobFarmPotato, CACO_JobFarmPotatoAmt.GetValue(), "{0}")		
	elseIf (option == OIDJobFarmWheat)
		CACO_JobFarmWheatAmt.SetValue(value)
		SetSliderOptionValue(OIDJobFarmWheat, CACO_JobFarmWheatAmt.GetValue(), "{0}")					
	elseif (option == OIDCookingXPMult)
		XPMultVal = value
		if XPMultVal == 0.0
			XPMultVal = 1.0
		endif
		SetSliderOptionValue(OIDCookingXPMult, XPMultVal, "{1}")
		CACO_PlayerCookingXPMult.SetValue(XPMultVal as float)	
	elseif (option == OIDDrunkTolerance)
		ToleranceVal = value
		SetSliderOptionValue(OIDDrunkTolerance, ToleranceVal, "{0}")
		CACO_AlcoholicBaseTolerance.SetValue(ToleranceVal as int)		
	elseif (option == OIDSleepMinHours)
		MinHoursRestedVal = value
		SetSliderOptionValue(OIDSleepMinHours, MinHoursRestedVal, "{0} hrs")
		CACO_SleepMinHoursRested.SetValue(MinHoursRestedVal as int)					
	endif
EndEvent

Event OnOptionDefault(int option)
	if (option == OIDExtraIngrPrePerkChance)
		ExtraIngrPrePerkVal = 30
		SetSliderOptionValue(OIDExtraIngrPrePerkChance, ExtraIngrPrePerkVal, "{0}%")
		CheckHarvestRates()
	elseIf (option == OIDExtraIngrPostPerkChance)
		ExtraIngrPostPerkVal = 60
		SetSliderOptionValue(OIDExtraIngrPostPerkChance, ExtraIngrPostPerkVal, "{0}%")
		CACOExtraIngrChancePostPerk_KRY.SetValue(40)
		CheckHarvestRates()
	elseIf (option == OIDGardenInitialTime)
		GardenInitialVal = 3
		SetSliderOptionValue(OIDGardenInitialTime, GardenInitialVal, "{0}")
		CACO_GardenInitialGrowDays.SetValue(3)
	elseIf (option == OIDGardenRegrowTime)
		GardenRegrowVal = 3
		SetSliderOptionValue(OIDGardenRegrowTime, GardenRegrowVal, "{0}")
		CACO_GardenRegrowDays.SetValue(3)	
	elseIf (option == OIDGardenFertilizerTime)
		GardenFertilizerVal = 30
		SetSliderOptionValue(OIDGardenFertilizerTime, GardenFertilizerVal, "{0}")
		CACO_GardenFertilizerDays.SetValue(30)	
	elseif (option == OIDAlchemyXPRate)
		AlchXPMultVal = 1.0
		if Game.GetPlayer().HasPerk(CACO_AlchXPRate)
			Game.GetPlayer().RemovePerk(CACO_AlchXPRate)
		endif	
		SetSliderOptionValue(OIDAlchemyXPRate, AlchXPMultVal, "{1.00}")
		CACO_OptionAlchXPRate.SetValue(1.0)			
	elseIf (option == OIDJobFarmCabbage)
		CACO_JobFarmCabbageAmt.SetValue(5)
		SetSliderOptionValue(OIDJobFarmCabbage, CACO_JobFarmCabbageAmt.GetValue(), "{0}")
	elseIf (option == OIDJobFarmGourd)
		CACO_JobFarmGourdAmt.SetValue(10)
		SetSliderOptionValue(OIDJobFarmGourd, CACO_JobFarmGourdAmt.GetValue(), "{0}")	
	elseIf (option == OIDJobFarmLeek)
		CACO_JobFarmLeekAmt.SetValue(5)
		SetSliderOptionValue(OIDJobFarmLeek, CACO_JobFarmLeekAmt.GetValue(), "{0}")		
	elseIf (option == OIDJobFarmNirnroot)
		CACO_JobFarmNirnrootAmt.SetValue(5)
		SetSliderOptionValue(OIDJobFarmNirnroot, CACO_JobFarmNirnrootAmt.GetValue(), "{0}")	
	elseIf (option == OIDJobFarmPotato)
		CACO_JobFarmPotatoAmt.SetValue(10)
		SetSliderOptionValue(OIDJobFarmPotato, CACO_JobFarmPotatoAmt.GetValue(), "{0}")		
	elseIf (option == OIDJobFarmWheat)
		CACO_JobFarmWheatAmt.SetValue(50)
		SetSliderOptionValue(OIDJobFarmWheat, CACO_JobFarmWheatAmt.GetValue(), "{0}")				
	elseif (option == OIDCookingXPMult)
		XPMultVal = 1.0
		SetSliderOptionValue(OIDCookingXPMult, XPMultVal, "{1}")
		CACO_PlayerCookingXPMult.SetValue(1.0)			
	elseif (option == OIDDrunkTolerance)
		ToleranceVal = 5
		SetSliderOptionValue(OIDDrunkTolerance, ToleranceVal, "{0}")
		CACO_AlcoholicBaseTolerance.SetValue(5)	
	elseif (option == OIDSleepMinHours)
		MinHoursRestedVal = 6
		SetSliderOptionValue(OIDSleepMinHours, MinHoursRestedVal, "{0} hrs")
		CACO_SleepMinHoursRested.SetValue(6)					
	endif
EndEvent

event OnOptionHighlight(int option)
	if (option == OIDExtraIngrPrePerkChance)
		SetInfoText("$CACODesc_IngrPrePerkChance")
	elseif (option == OIDExtraIngrPostPerkChance)
		SetInfoText("$CACODesc_IngrPostPerkChance")
	elseif (option == OIDAdditionalMinIngr)
		SetInfoText("$CACODesc_MinIngredients")
	elseif (option == OIDAdditionalMinMeat)
		SetInfoText("$CACODesc_MinMeat")
	elseif (option == OIDGardenInitialTime)
		SetInfoText("$CACODesc_GardenInitialTime")
	elseif (option == OIDGardenRegrowTime)
		SetInfoText("$CACODesc_GardenRegrowTime")
	elseif (option == OIDGardenFertilizerTime)
		SetInfoText("$CACODesc_GardenFertilizerTime")
	elseif (option == OIDGardenFertilizerOption)
		SetInfoText("$CACODesc_GardenFertilizerOpt")	
	elseif (option == OIDJobFarmCabbage)
		SetInfoText("$CACODesc_FarmJobCabbage")
	elseif (option == OIDJobFarmGourd)
		SetInfoText("$CACODesc_FarmJobGourd")				
	elseif (option == OIDJobFarmLeek)
		SetInfoText("$CACODesc_FarmJobLeek")
	elseif (option == OIDJobFarmNirnroot)
		SetInfoText("$CACODesc_FarmJobNirnroot")
	elseif (option == OIDJobFarmPotato)
		SetInfoText("$CACODesc_FarmJobPotato")
	elseif (option == OIDJobFarmWheat)
		SetInfoText("$CACODesc_FarmJobWheat")
	elseif (option == OIDAddIngr)
		SetInfoText("$CACODesc_AddIngredient")
	elseif (option == OIDAddFoods)
		SetInfoText("$CACODesc_AddFood")		
	elseif (option == OIDAddTools)
		SetInfoText("$CACODesc_AddTools")		
	elseif (option == OIDLearnEffects)
		SetInfoText("$CACODesc_LearnEffects")
	elseif (option == OIDSwapItems)
		SetInfoText("$CACODesc_SwapItems")
	elseif (option == OIDSwapSoulHusk)
		SetInfoText("$CACODesc_SwapSoulHusk")
	elseif (option == OIDSwapHorkerTusk)
		SetInfoText("$CACODesc_SwapHorkerTusk")
	elseif (option == OIDSwapDragonScales)
		SetInfoText("$CACODesc_SwapDragonScales")
	elseif (option == OIDSwapHumanFlesh)
		SetInfoText("$CACODesc_SwapHumanFlesh")
	elseif (option == OIDSwapSkeeverHide)
		SetInfoText("$CACODesc_SwapSkeeverHide")		
	elseif (option == OIDSwapBoneHawkClaw)
		SetInfoText("$CACODesc_SwapBoneHawkClaw")
	elseif (option == OIDSwapBoneHawkFeather)
		SetInfoText("$CACODesc_SwapBoneHawkFeather")
	elseif (option == OIDSwapScalpel)
		SetInfoText("$CACODesc_SwapScalpel")		
	elseif (option == OIDHealthDur)
		SetInfoText("$CACODesc_HealthDur")
	elseif (option == OIDStaminaDur)
		SetInfoText("$CACODesc_StaminaDur")
	elseif (option == OIDMagickaDur)
		SetInfoText("$CACODesc_MagickaDur")
	elseif (option == OIDHealthDamDur)
		SetInfoText("$CACODesc_HealthDamDur")
	elseif (option == OIDStaminaDamDur)
		SetInfoText("$CACODesc_StaminaDamDur")
	elseif (option == OIDMagickaDamDur)
		SetInfoText("$CACODesc_MagickaDamDur")
	elseif (option == OIDVampireRestoreHealth)
		SetInfoText("$CACODesc_VampireRestoreHealth")
	elseif (option == OIDStackableEffects)
		SetInfoText("$CACODesc_StackableEffects")
	elseif (option == OIDRequireMortar)
		SetInfoText("$CACODesc_RequireMortar")
	elseif (option == OIDRenamePotions)
		SetInfoText("$CACODesc_RenamePotions")
	elseif (option == OIDFoodFrequency)
		SetInfoText("$CACODesc_FoodFrequency")
	elseif (option == OIDFoodQuantity)
		SetInfoText("$CACODesc_FoodQuantity")		
	elseif (option == OIDDeadlyVenom)
		SetInfoText("$CACODesc_DeadlyVenom")
	elseif (option == OIDMilkCows)
		SetInfoText("$CACODesc_MilkWool")	
	elseif (option == OIDHarvestBodyMsgBox)
		SetInfoText("$CACODesc_HarvestBodyMsgBox")	
	elseif (option == OIDBombNotifications)
		SetInfoText("$CACODesc_BombNotifications")			
	elseif (option == OIDLoadScreens)
		SetInfoText("$CACODesc_LoadScreens")			
	elseif (option == OIDDrunkAnimations)
		SetInfoText("$CACODesc_DrunkAnimations")
	elseif (option == OIDDrunkVisuals)
		SetInfoText("$CACODesc_DrunkVisuals")		
	elseif (option == OIDDrunkMessages)
		SetInfoText("$CACODesc_DrunkMessages")			
	elseif (option == OIDDrunkTolerance)
		SetInfoText("$CACODesc_DrunkTolerance")	
	elseif (option == OIDWaterWellEnable)
		SetInfoText("$CACODesc_WaterWellEnable")	
	elseif (option == OIDWaterWellBucket)
		SetInfoText("$CACODesc_WaterWellBucket")	
	elseif (option == OIDCookingXPEnabled)
		SetInfoText("$CACODesc_CookingXPEnabled")	
	elseif (option == OIDCurrentCookingSkill)
		SetInfoText("$CACODesc_CurrentCookingSkill")	
	elseif (option == OIDAlchemyXPRate)
		SetInfoText("$CACODesc_AlchemyXPRate")			
	elseif (option == OIDCookingXPMult)
		SetInfoText("$CACODesc_CookingXPMult")			
	elseif (option == OIDBasicNeedsHungerEnable)
		SetInfoText("$CACODesc_BasicNeedsHunger")			
	elseif (option == OIDBasicNeedsFatigueEnable)
		SetInfoText("$CACODesc_BasicNeedsFatigue")			
	elseif (option == OIDSleepChangesEnable)
		SetInfoText("$CACODesc_SleepChanges")			
	elseif (option == OIDSleepAllowWerewolf)
		SetInfoText("$CACODesc_SleepAllowWerewolf")
	elseif (option == OIDSleepMinHours)
		SetInfoText("$CACODesc_SleepMinHours")	
	elseif (option == OIDCraftFreeWater)
		SetInfoText("$CACODesc_CraftFreeWater")			
	elseif (option == OIDCookingNewRecipes)
		SetInfoText("$CACODesc_CookingNewRecipes")			
	elseif (option == OIDCookingInventoryCond)
		SetInfoText("$CACODesc_CookingInventoryCond")
	elseif (option == OIDAlchemyInventoryCond)
		SetInfoText("$CACODesc_AlchemyInventoryCond")
	elseif (option == OIDRecipesTeachEffects)
		SetInfoText("$CACODesc_RecipesTeachEffects")
	elseif (option == OIDHarvestFlesh)
		SetInfoText("$CACODesc_HarvestFlesh")
	elseif (option == OIDMarkAsEaten)
		SetInfoText("$CACODesc_MarkAsEaten")
	elseif (option == OIDCookingCombinePortions)
		SetInfoText("$CACODesc_CombinePortions")
	elseif (option == OIDDisableWorkbenchOptions)
		SetInfoText("$CACODesc_DisableWorkbench")
	elseif (option == OIDDisableChurnOptions)
		SetInfoText("$CACODesc_DisableChurn")	
	elseif (option == OIDToggleDistillPotionRecipes)
		SetInfoText("$CACODesc_DistillRecipes")
	elseif (option == OIDCurrentCookingRank) && (CACO_PlayerCookingSkillRank.GetValue() == 0)
		SetInfoText("$CACODesc_CookingRankNovice")
	elseif (option == OIDCurrentCookingRank) && (CACO_PlayerCookingSkillRank.GetValue() == 1)
		SetInfoText("$CACODesc_CookingRankApprentice")		
	elseif (option == OIDCurrentCookingRank) && (CACO_PlayerCookingSkillRank.GetValue() == 2)
		SetInfoText("$CACODesc_CookingRankAdept")		
	elseif (option == OIDCurrentCookingRank) && (CACO_PlayerCookingSkillRank.GetValue() == 3)
		SetInfoText("$CACODesc_CookingRankExpert")		
	elseif (option == OIDCurrentCookingRank) && (CACO_PlayerCookingSkillRank.GetValue() == 4)
		SetInfoText("$CACODesc_CookingRankMaster")		
	elseif (option == OIDBasicNeedsNotifications)
		SetInfoText("$CACODesc_NeedsNotifications")		
	elseif (option == OIDXPNotifications)
		SetInfoText("$CACODesc_XPNotifications")					
	elseif (option == OIDPotionWeights)
		SetInfoText("$CACODesc_PotionWeights")			
	elseif (option == OIDStopAnimations)
		SetInfoText("$CACODesc_StopAnimations")
	elseif (option == OIDUpdateiNeedLists)	
		SetInfoText("$CACODesc_UpdateiNeedLists")	
	elseif (option == OIDRagdollParalysis)
		SetInfoText("$CACODesc_RagdollParalysis")
	endif
endevent

Function CheckHarvestRates()
	if Game.GetPlayer().HasPerk(GreenThumb)
		HarvestChance = (100 -  ExtraIngrPostPerkVal) as int
	else
		HarvestChance = (100 -  ExtraIngrPrePerkVal) as int
	endif
	CACOExtraIngrChance_KRY.SetValue(HarvestChance)
EndFunction

Function AdvChoice(int option)
	currentval = option
	if currentval < 2
		currentval = currentval + 1
	else
		currentval = 0
	endif
endFunction

Function AdvFoodChoice(int option)
	currentval = option
	if currentval < 3
		currentval = currentval + 1
	else
		currentval = 0
	endif
endFunction

; sschofida - there are a few special ingredients that will multiply the variable durations
Function ChangeIngredientDuration(formlist IngredientFormList, int ieffect, int iduration, int isDamage)
	if iduration == 0
		fxduration = 1
	elseif iduration == 1
		fxduration = 10 / (isDamage + 1) ;schofida - update duration
	else
		fxduration = 20 / (isDamage + 1)  ;schofida - update duration
	endif
	Int iIndex = IngredientFormList.GetSize() as int
	While iIndex
		iIndex -= 1
		Ingredient CurrentIng = IngredientFormList.GetAt(iIndex) as Ingredient
		int factor = 1 ; schofida - addition
		int factorIndex = REQ_CACO_SpecialIngrs.Find(CurrentIng)
		if (factorIndex > -1)
			factor = REQ_CACO_SpecialIngrsMultiplier[factorIndex]
		endif
		(CurrentIng as Ingredient).SetNthEffectDuration(ieffect, fxduration * factor)
	endWhile
endFunction

;schofida - New function to set the magnitude of ingredients to tone down effects when eaten based on number of seconds
;						1 sec = CACO values
;						5 sec = REQ values X 2
;						10 sec = REQ values
Function FixIngConsumeFunction(Float[] override = none)
	Float[] ingrMag
	int iIngr = REQ_CACO_FixIngConsume.Length as int
	While iIngr
		iIngr -= 1
		Ingredient CurrentIng = REQ_CACO_FixIngConsume[iIngr] as Ingredient
		int iduration = 0
		if (CACO_RestoreIngH1st.HasForm(CurrentIng))
			iduration = CACO_RestoreHealthDuration.GetValue() as int
		elseif (CACO_RestoreIngM1st.HasForm(CurrentIng))
			iduration = CACO_RestoreMagickaDuration.GetValue() as int
		else
			iduration = CACO_RestoreStaminaDuration.GetValue() as int
		endif
		if (override != none)
			ingrMag	= override
		else
			if iduration == 2
				ingrMag = REQ_CACO_REQIngrMags
			elseif iduration == 1
				ingrMag = REQ_CACO_REQIngrMagsx2
			else
				ingrMag = REQ_CACO_CACOIngrMags
			endif			
		endif
		(CurrentIng as Ingredient).SetNthEffectMagnitude(0, (ingrMag[iIngr]))
		if iduration == 0
			fxduration = 1
		elseif iduration == 1
			fxduration = 10  ;schofida - update duration
		else
			fxduration = 20  ;schofida - update duration
		endif
		if (fxduration > 1)
			int factor = 1
			int factorIndex = REQ_CACO_SpecialIngrs.Find(CurrentIng)
			if (factorIndex > -1)
				factor = REQ_CACO_SpecialIngrsMultiplier[factorIndex]
			endif
			if (override != none)
				(CurrentIng as Ingredient).SetNthEffectDuration(0, fxduration * factor)
			else
				(CurrentIng as Ingredient).SetNthEffectDuration(0, (fxduration * factor) / 2)
			endif
		endif
	endWhile	
EndFunction

Function ChangeStackablePotions(formlist EffectFormList, string PrimeAV, keyword RelatedKW)
	Int iIndex = EffectFormList.GetSize() 
	If EffectsDontStackVal == 0
		While iIndex
			iIndex -= 1
			MagicEffect CurrentEffect = EffectFormList.GetAt(iIndex) As MagicEffect 
			MagExtend.SetMGEFArchetype(CurrentEffect, "ValueMod", primaryAV = PrimeAV, relatedForm = NONE)
		EndWhile
	else
		While iIndex
			iIndex -= 1
			MagicEffect CurrentEffect = EffectFormList.GetAt(iIndex) As MagicEffect 
			MagExtend.SetMGEFArchetype(CurrentEffect, "PeakValueMod", primaryAV = PrimeAV, relatedForm = RelatedKW)
		EndWhile
	EndIf
EndFunction

Function ChangeParalysisEffects()
	Int iIndex = CACO_RagdollParalysisEffectList.GetSize() 
	If CACO_OptionRagdollParalysis.GetValue() == 0
		While iIndex
			iIndex -= 1
			MagicEffect CurrentEffect = CACO_RagdollParalysisEffectList.GetAt(iIndex) As MagicEffect 
			MagExtend.SetMGEFArchetype(CurrentEffect, "Paralysis")
		EndWhile
	else
		While iIndex
			iIndex -= 1
			MagicEffect CurrentEffect = CACO_RagdollParalysisEffectList.GetAt(iIndex) As MagicEffect 
			MagExtend.SetMGEFArchetype(CurrentEffect, "Script")
		EndWhile
	EndIf
EndFunction


Function SwapSoulHusk()
	ItemCount = Game.GetPlayer().GetItemCount(VanSoulHusk) as int
	If ItemCount > 0 
		Game.GetPlayer().RemoveItem(VanSoulHusk, ItemCount, true)
		Game.GetPlayer().AddItem(CACOSoulHusk, ItemCount, true)
	else
		ItemCount = Game.GetPlayer().GetItemCount(CACOSoulHusk) as int
		Game.GetPlayer().RemoveItem(CACOSoulHusk, ItemCount, true)
		Game.GetPlayer().AddItem(VanSoulHusk, ItemCount, true)
	endif
EndFunction

Function SwapHorkerTusk()
	ItemCount = Game.GetPlayer().GetItemCount(VanHorkerTusk) as int
	If ItemCount > 0
		Game.GetPlayer().RemoveItem(VanHorkerTusk, ItemCount, true)
		Game.GetPlayer().AddItem(CACOHorkerTusk, ItemCount, true)
	else
		ItemCount = Game.GetPlayer().GetItemCount(CACOHorkerTusk) as int
		Game.GetPlayer().RemoveItem(CACOHorkerTusk, ItemCount, true)
		Game.GetPlayer().AddItem(VanHorkerTusk, ItemCount, true)
	endif
EndFunction

Function SwapHumanFlesh()
	ItemCount = Game.GetPlayer().GetItemCount(VanHumanFlesh) as int
	If ItemCount > 0
		Game.GetPlayer().RemoveItem(VanHumanFlesh, ItemCount, true)
		Game.GetPlayer().AddItem(CACOHumanFlesh, ItemCount, true)
	else
		ItemCount = Game.GetPlayer().GetItemCount(CACOHumanFlesh) as int
		Game.GetPlayer().RemoveItem(CACOHumanFlesh, ItemCount, true)
		Game.GetPlayer().AddItem(VanHumanFlesh, ItemCount, true)
	endif
EndFunction

Function SwapHeartScales()
	ItemCount = Game.GetPlayer().GetItemCount(VanHeartScales) as int
	If ItemCount > 0
		Game.GetPlayer().RemoveItem(VanHeartScales, ItemCount, true)
		Game.GetPlayer().AddItem(CACOHeartScales, ItemCount, true)
	else
		ItemCount = Game.GetPlayer().GetItemCount(CACOHeartScales) as int
		Game.GetPlayer().RemoveItem(CACOHeartScales, ItemCount, true)
		Game.GetPlayer().AddItem(VanHeartScales, ItemCount, true)
	endif
EndFunction

Function SwapBoneHawkClaw()
	ItemCount = Game.GetPlayer().GetItemCount(VanBoneHawkClaw) as int
	If ItemCount > 0
		Game.GetPlayer().RemoveItem(VanBoneHawkClaw, ItemCount, true)
		Game.GetPlayer().AddItem(CACOBoneHawkClaw, ItemCount, true)
	else
		ItemCount = Game.GetPlayer().GetItemCount(CACOBoneHawkClaw) as int
		Game.GetPlayer().RemoveItem(CACOBoneHawkClaw, ItemCount, true)
		Game.GetPlayer().AddItem(VanBoneHawkClaw, ItemCount, true)
	endif
EndFunction

Function SwapBoneHawkFeather()
	ItemCount = Game.GetPlayer().GetItemCount(VanBoneHawkFeather) as int
	If ItemCount > 0
		Game.GetPlayer().RemoveItem(VanBoneHawkFeather, ItemCount, true)
		Game.GetPlayer().AddItem(CACOBoneHawkFeather, ItemCount, true)
	else
		ItemCount = Game.GetPlayer().GetItemCount(CACOBoneHawkFeather) as int
		Game.GetPlayer().RemoveItem(CACOBoneHawkFeather, ItemCount, true)
		Game.GetPlayer().AddItem(VanBoneHawkFeather, ItemCount, true)
	endif
EndFunction

Function SwapSkeeverHide()
	ItemCount = Game.GetPlayer().GetItemCount(VanSkeeverHide) as int
	If ItemCount > 0
		Game.GetPlayer().RemoveItem(VanSkeeverHide, ItemCount, true)
		Game.GetPlayer().AddItem(CACOSkeeverHide, ItemCount, true)
	else
		ItemCount = Game.GetPlayer().GetItemCount(CACOSkeeverHide) as int
		Game.GetPlayer().RemoveItem(CACOSkeeverHide, ItemCount, true)
		Game.GetPlayer().AddItem(VanSkeeverHide, ItemCount, true)
	endif
EndFunction

Function SwapScalpel()
	ItemCount = Game.GetPlayer().GetItemCount(VanScalpel) as int
	If ItemCount > 0
		Game.GetPlayer().RemoveItem(VanScalpel, ItemCount, true)
		Game.GetPlayer().AddItem(CACOScalpel, ItemCount, true)
	else
		ItemCount = Game.GetPlayer().GetItemCount(CACOScalpel) as int
		Game.GetPlayer().RemoveItem(CACOScalpel, ItemCount, true)
		Game.GetPlayer().AddItem(VanScalpel, ItemCount, true)
	endif
EndFunction


Function RevealAllEffects()
	Int iIndex = AllIngredientFormList.GetSize() 
		While iIndex
			Ingredient CurrentIng = AllIngredientFormList.GetAt(iIndex) As Ingredient 
			CurrentIng.LearnAllEffects()		
			iIndex -= 1
		EndWhile
EndFunction

Function PotionMaintenance()
	int iIndex = -1
	iIndex = CACO_AlchemyPotionWeightList04.GetSize() 
		While iIndex
			iIndex -= 1
			CurrentPotion = CACO_AlchemyPotionWeightList04.GetAt(iIndex) As Potion
			CurrentPotion.SetWeight(0.6)	
		EndWhile
	iIndex = CACO_AlchemyPotionWeightList03.GetSize() 
		While iIndex
			iIndex -= 1		
			CurrentPotion = CACO_AlchemyPotionWeightList03.GetAt(iIndex) As Potion
			CurrentPotion.SetWeight(0.4)	
		EndWhile
	iIndex = CACO_AlchemyPotionWeightList02.GetSize() 
		While iIndex
			iIndex -= 1		
			CurrentPotion = CACO_AlchemyPotionWeightList02.GetAt(iIndex) As Potion
			CurrentPotion.SetWeight(0.3)	
		EndWhile			
endFunction
Scriptname CACO_PlayerLoadGameAlias extends ReferenceAlias  
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
						Call ingredient fix from CACOQuest on Player Load and Init
						Weights are now 0.6 - 0.5 - 0.4
						New mechanic - There are some special ingredients that will multiply potion duration.
}
Perk Property AlchDurationModifier Auto
Perk Property AlchMortarPestleModifier Auto
Perk Property FoodEffectTimescaleFix Auto
Perk Property CreatureHarvestPerk Auto
Perk Property CACO_HarvestFleshPerk Auto
Perk Property AlchAnatomist Auto
Perk Property WaterWellOptions Auto
Perk Property ReplaceButterChurn Auto
Perk Property AlchRetortPerk Auto
Formlist Property AlchSwapList Auto
Formlist Property ModFilterList Auto
Actor Property PlayerActor auto
ObjectReference property PlayerRef auto
Ingredient property SoulHuskIngr auto
Ingredient property HorkerTuskIngr auto
Potion property HumanFleshFood auto
Potion property CharredSkeeverHideFood auto
Ingredient property DragonScaleIngr auto
Ingredient property BoneHawkClawIngr auto
Ingredient property BoneHawkFeatherIngr auto
Weapon property ScalpelTool auto
GlobalVariable property CACOIgnoreIngAddition_KRY Auto
GlobalVariable property CACO_FoodCraftFreeWater Auto
GlobalVariable property GameDaysPassed Auto
GlobalVariable property CACO_UseCACOIngr Auto
GlobalVariable property CACO_UseVanillaIngr Auto
GlobalVariable property CACO_CACOIsInstalled Auto
GlobalVariable property CACO_PlayerCookingXPEnabled Auto
GlobalVariable property CACO_NoRestoreHealthForVampires Auto
Keyword property AlchDurationBased Auto
Keyword property ObjectMortarPestle Auto
Keyword property ObjectAlchemistRetort Auto
Keyword property ObjectAlchemistCrucible Auto
Keyword property WorkbenchPlaceholder Auto
GlobalVariable Property CACO_DaggerEquipped Auto
Keyword Property WeapTypeDagger Auto
ObjectReference Property CrucibleContainer Auto
Furniture property CACO_MortarAndPestle01Furn auto
Furniture property CACO_RetortFurn auto
MiscObject property CACO_MortarPestle01Misc auto
FormList Property CACO_AlchemyPotionWeightList02 Auto
FormList Property CACO_AlchemyPotionWeightList03 Auto
FormList Property CACO_AlchemyPotionWeightList04 Auto
FormList Property CACO_AllIngredientsFormlist Auto
FormList Property CACO_AlchemyRecipesRead Auto
FormList Property WaterskinList Auto
Spell Property CACO_FoodBasicNeedsEffect Auto
Spell Property Flames Auto
Spell Property Healing Auto
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
GlobalVariable property CACO_RestoreStaminaDuration Auto
GlobalVariable property CACO_RestoreMagickaDuration Auto
GlobalVariable property CACO_RestoreHealthDuration Auto
GlobalVariable property CACO_DamageStaminaDuration Auto
GlobalVariable property CACO_DamageMagickaDuration Auto
GlobalVariable property CACO_DamageHealthDuration Auto
LeveledItem Property CACO_IngrRestoreHealth1st Auto
LeveledItem Property CACO_IngrRestoreHealth2nd Auto
LeveledItem Property CACO_IngrRestoreHealth3rd Auto
LeveledItem Property CACO_IngrRestoreHealth4th Auto
LeveledItem Property CACO_IngrRestoreStamina1st Auto
LeveledItem Property CACO_IngrRestoreStamina2nd Auto
LeveledItem Property CACO_IngrRestoreStamina3rd Auto
LeveledItem Property CACO_IngrRestoreStamina4th Auto
LeveledItem Property CACO_IngrRestoreMagicka1st Auto
LeveledItem Property CACO_IngrRestoreMagicka2nd Auto
LeveledItem Property CACO_IngrRestoreMagicka3rd Auto
LeveledItem Property CACO_IngrRestoreMagicka4th Auto
LeveledItem Property CACO_IngrDamageHealth1st Auto
LeveledItem Property CACO_IngrDamageHealth2nd Auto
LeveledItem Property CACO_IngrDamageHealth3rd Auto
LeveledItem Property CACO_IngrDamageHealth4th Auto
LeveledItem Property CACO_IngrDamageStamina1st Auto
LeveledItem Property CACO_IngrDamageStamina2nd Auto
LeveledItem Property CACO_IngrDamageStamina3rd Auto
LeveledItem Property CACO_IngrDamageStamina4th Auto
LeveledItem Property CACO_IngrDamageMagicka1st Auto
LeveledItem Property CACO_IngrDamageMagicka2nd Auto
LeveledItem Property CACO_IngrDamageMagicka3rd Auto
LeveledItem Property CACO_IngrDamageMagicka4th Auto
Int LastResH01 
Int LastResH02 
Int LastResH03 
Int LastResH04 
Int LastResS01 
Int LastResS02 
Int LastResS03 
Int LastResS04 
Int LastResM01 
Int LastResM02 
Int LastResM03 
Int LastResM04 
Int LastDamH01 
Int LastDamH02 
Int LastDamH03 
Int LastDamH04 
Int LastDamS01 
Int LastDamS02 
Int LastDamS03 
Int LastDamS04 
Int LastDamM01 
Int LastDamM02 
Int LastDamM03 
Int LastDamM04 
Int fxduration
Int iIngr 
Int iIndex
Potion CurrentPotion
Book CurrentRecipe
int ModPosition = 255
bool WyrmstoothInst
bool CampfireInst
GlobalVariable Property CACO_ModCampfireInst Auto
bool FrostfallInst
GlobalVariable Property CACO_ModFrostfallInst Auto
bool LastSeedInst
GlobalVariable Property CACO_ModLastSeedInst Auto
bool iNeedInst
GlobalVariable Property CACO_ModiNeedInst Auto
bool BreezehomeUpgradable
FormList HeavyFood
FormList MedFood
FormList LightFood
FormList NoSpoilFood
FormList SoupFood
FormList RawFood
FormList DrinkFood
FormList DrinkNoAlcFood
FormList IgnoreFood
FormList Property CACOHeavyFoodList Auto
FormList Property CACOMedFoodList Auto
FormList Property CACOLightFoodList Auto
FormList Property CACONoSpoilFoodList Auto
FormList Property CACOSoupFoodList Auto
FormList Property CACORawFoodList Auto
FormList Property CACODrinkFoodList Auto
FormList Property CACODrinkNoAlcFoodList Auto
FormList Property CACOIgnoreList Auto
Formlist Property CACO_StackableHealthEffects Auto
Formlist Property CACO_StackableMagickaEffects Auto
Formlist Property CACO_StackableStaminaEffects Auto
Formlist Property flPlanterFertilizerItem Auto
Keyword Property MagicAlchRestoreHealth Auto
Keyword Property MagicAlchRestoreMagicka Auto
Keyword Property MagicAlchRestoreStamina Auto
Message Property StolenMessage Auto
CACO_MCMScript Property CACOQuest auto

Ingredient[] Property REQ_CACO_SpecialIngrs Auto
Int[] Property REQ_CACO_SpecialIngrsMultiplier Auto

float Version

event OnPlayerLoadGame()
	(GetOwningQuest() as SKI_QuestBase).OnGameReload()
	RunModCheck()
	PotionMaintenance()
	RecipeMaintenance()
endEvent

Event OnInit()
	if !(debug.getplatformname() as bool)
		int ibutton = StolenMessage.show()
		if ibutton >= 0
			game.quittomainmenu()
		endif
	endif		
	CACO_UseCACOIngr.SetValue(0)
	CACO_UseVanillaIngr.SetValue(100)
	CACO_CACOIsInstalled.SetValue(1)	
	CACO_PlayerCookingXPEnabled.SetValue(1)	
	CACO_NoRestoreHealthForVampires.SetValue(1)
	Game.GetPlayer().Addperk(AlchDurationModifier)
	Game.GetPlayer().Addperk(AlchMortarPestleModifier)
	Game.GetPlayer().Addperk(FoodEffectTimescaleFix)
	Game.GetPlayer().Addperk(CreatureHarvestPerk)
	Game.GetPlayer().Addperk(CACO_HarvestFleshPerk)
	Game.GetPlayer().Addperk(WaterWellOptions)
	Game.GetPlayer().Addperk(ReplaceButterChurn)
	if !Game.GetPlayer().HasPerk(AlchRetortPerk)
		Game.GetPlayer().Addperk(AlchRetortPerk)	
	endif
	Game.GetPlayer().Addspell(CACO_FoodBasicNeedsEffect, false)
	AddInventoryEventFilter(AlchSwapList)
	AddInventoryEventFilter(ModFilterList)
	CACOQuest.SwapSoulHusk()
	CACOQuest.SwapHorkerTusk()
	CACOQuest.SwapHumanFlesh()
	CACOQuest.SwapHeartScales()
	CACOQuest.SwapBoneHawkClaw()
	CACOQuest.SwapBoneHawkFeather()
	CACOQuest.SwapSkeeverHide()
	CACOQuest.SwapScalpel()
	RunModCheck()	
	Version = 2.0
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If CACOIgnoreIngAddition_KRY.GetValue() == 0
		If akBaseItem == AlchSwapList.GetAt(0) 					;soul husk
			PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
			PlayerRef.AddItem(SoulHuskIngr, aiItemCount, true)
		ElseIf akBaseItem == AlchSwapList.GetAt(1)					;horker tusk
			PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
			PlayerRef.AddItem(HorkerTuskIngr, aiItemCount, true)
		ElseIf akBaseItem == AlchSwapList.GetAt(2)					;human flesh
			PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
			PlayerRef.AddItem(HumanFleshFood, aiItemCount, true)
		ElseIf akBaseItem == AlchSwapList.GetAt(3)					;dragon heart scales
			PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
			PlayerRef.AddItem(DragonScaleIngr, aiItemCount, true)
		ElseIf akBaseItem == AlchSwapList.GetAt(4)					;bone hawk claw
			PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
			PlayerRef.AddItem(BoneHawkClawIngr, aiItemCount, true)
		ElseIf akBaseItem == AlchSwapList.GetAt(5)					;bone hawk feathers
			PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
			PlayerRef.AddItem(BoneHawkFeatherIngr, aiItemCount, true)
		ElseIf akBaseItem == AlchSwapList.GetAt(6)					;charred skeever hide
			PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
			PlayerRef.AddItem(CharredSkeeverHideFood, aiItemCount, true)	
		ElseIf akBaseItem == AlchSwapList.GetAt(7)					;RuinsScalpel
			PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
			PlayerRef.AddItem(ScalpelTool, aiItemCount, true)					
		EndIf
	Endif
	If CampfireInst && akBaseItem == (Game.GetFormFromFile(0x02038689, "Campfire.esm"))
		PlayerRef.RemoveItem(akBaseItem, aiItemCount, true)
		PlayerRef.AddItem(CACO_MortarPestle01Misc, aiItemCount, true)
	Endif		
EndEvent


Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject.HasKeyword(ObjectMortarPestle)
		if PlayerActor.IsInCombat() || PlayerActor.IsSwimming() || PlayerActor.GetSitState() != 0 || PlayerActor.GetSleepState() != 0 || PlayerActor.IsOnMount() || PlayerActor.IsSneaking()
			debug.notification("You cannot use this item right now.")
		else
			Game.DisablePlayerControls() 		;Kick them out of the menus
			Game.EnablePlayerControls()		
			PlayerRef.PlaceAtMe(CACO_MortarAndPestle01Furn)
		endif
	elseif akBaseObject.HasKeyword(ObjectAlchemistRetort)
		if PlayerActor.IsInCombat() || PlayerActor.IsSwimming() || PlayerActor.GetSitState() != 0 || PlayerActor.GetSleepState() != 0 || PlayerActor.IsOnMount() || PlayerActor.IsSneaking()
			debug.notification("You cannot use this item right now.")
		else
			Game.DisablePlayerControls() 		;Kick them out of the menus
			Game.EnablePlayerControls()		
			PlayerRef.PlaceAtMe(CACO_RetortFurn)
		endif
	elseif akBaseObject.HasKeyword(ObjectAlchemistCrucible)
		if PlayerActor.IsInCombat() || PlayerActor.IsSwimming() || PlayerActor.GetSitState() != 0 || PlayerActor.GetSleepState() != 0 || PlayerActor.IsOnMount() || PlayerActor.IsSneaking()
			debug.notification("You cannot use this item right now.")
		else
			Game.DisablePlayerControls() 		;Kick them out of the menus
			Game.EnablePlayerControls()		
			CrucibleContainer.Activate(PlayerRef)
		endif		
	elseif akBaseObject.HasKeyword(WeapTypeDagger)
		CACO_DaggerEquipped.SetValue(1)
	endif
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	If akBaseObject.HasKeyword(WeapTypeDagger)
		Bool bEquipped = false
		if PlayerActor.GetEquippedObject(0)
			Form EquippedItemLeft = PlayerActor.GetEquippedObject(0) 	; Check Left Hand
			If EquippedItemLeft.HasKeyword(WeapTypeDagger)
				bEquipped = true
			endif	
		endif	
		if PlayerActor.GetEquippedObject(1)
			Form EquippedItemRight = PlayerActor.GetEquippedObject(1) 	; Check Right Hand
			If EquippedItemRight.HasKeyword(WeapTypeDagger)
				bEquipped = true
			endif	
		endif
		If bEquipped
			CACO_DaggerEquipped.SetValue(1)
		Else
			CACO_DaggerEquipped.SetValue(0)
		EndIf
	Endif
EndEvent	
		

Function PotionMaintenance()
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
		CACOQuest.ChangeStackablePotions(CACO_StackableHealthEffects, "Health", MagicAlchRestoreHealth)
		CACOQuest.ChangeStackablePotions(CACO_StackableMagickaEffects, "Magicka", MagicAlchRestoreMagicka)
		CACOQuest.ChangeStackablePotions(CACO_StackableStaminaEffects, "Stamina", MagicAlchRestoreStamina)		
		CACOQuest.ChangeParalysisEffects()
endFunction

Function RecipeMaintenance()
	iIndex = CACO_AlchemyRecipesRead.GetSize() 
	While iIndex
		iIndex -= 1
		CurrentRecipe = CACO_AlchemyRecipesRead.GetAt(iIndex) As Book
		CurrentRecipe.SetGoldValue(0)
	EndWhile
endFunction

Function RunModCheck()
	ModPosition = Game.GetModByName("Unofficial Skyrim Special Edition Patch.esp")
	if ModPosition != 255
		ConstructibleObject ModRecipe = (Game.GetFormFromFile(0x0200A30B, "Unofficial Skyrim Special Edition Patch.esp")) as ConstructibleObject		;RecipeBoarCooked
		ModRecipe.SetWorkbenchKeyword(WorkbenchPlaceholder)   		
	endif	
	ModPosition = Game.GetModByName("Campfire.esm")
	if ModPosition != 255	
		CACO_ModCampfireInst.SetValue(1)
		if !CampfireInst
			ModFilterList.AddForm(Game.GetFormFromFile(0x02038689, "Campfire.esm"))
		endif	
		CampfireInst = true
		int ItemCount = PlayerREF.GetItemCount(Game.GetFormFromFile(0x02038689, "Campfire.esm"))
		If ItemCount >= 1
			PlayerRef.RemoveItem(Game.GetFormFromFile(0x02038689, "Campfire.esm"), ItemCount, true)
			PlayerRef.AddItem(CACO_MortarPestle01Misc, ItemCount, true)
		endif	
	else
		CACO_ModCampfireInst.SetValue(0)
		CampfireInst = false
	endif		
	ModPosition = Game.GetModByName("Frostfall.esp")
	if ModPosition != 255	
		CACO_ModFrostfallInst.SetValue(1)
		FrostfallInst = true
	else
		CACO_ModFrostfallInst.SetValue(0)
		FrostfallInst = false
	endif	
	ModPosition = Game.GetModByName("LastSeed.esp")
	if ModPosition != 255	
		CACO_ModLastSeedInst.SetValue(1)
		if !LastSeedInst
			flPlanterFertilizerItem.AddForm(Game.GetFormFromFile(0x02007B4B, "LastSeed.esp"))
		endif	
		LastSeedInst = true	
	else
		CACO_ModLastSeedInst.SetValue(0)
		LastSeedInst = false
	endif	
	ModPosition = Game.GetModByName("iNeed.esp")
	if ModPosition != 255	
		CACO_ModiNeedInst.SetValue(1)
		if !iNeedInst
			UpdateiNeedWaterCompatibility()
			CACO_FoodCraftFreeWater.SetValue(0)
			Utility.Wait(30.0)
			UpdateiNeedFoodCompatibility()
			Utility.Wait(1.0)
			Int iWaterskin = WaterskinList.Find(Game.GetFormFromFile(0x02004376, "iNeed.esp"))
			If iWaterskin != 3 
				;debug.notification("CACO Error:  iNeed Waterskins are out of order.")
				WaterskinList.Revert()
				UpdateiNeedWaterCompatibility()
			EndIf		
			iNeedInst = true
		endif	
	else
		CACO_ModiNeedInst.SetValue(0)
		iNeedInst = false
	endif		
	ModPosition = Game.GetModByName("Breezehome_Fully_Upgradable.esp")
	if ModPosition != 255
		if !BreezehomeUpgradable
			FormList BFUH_AlcAll = Game.GetFormFromFile(0x0204914E, "Breezehome_Fully_Upgradable.esp") as FormList
			UpdateFormLists(BFUH_AlcAll, CACO_AllIngredientsFormlist)
		endif	
		BreezehomeUpgradable = true
	else
		BreezehomeUpgradable = false
	endif	
	
;check for new ingredients added by patches and CACO compatible mods.  Add to list.	
	int RestoreHDur = CACO_RestoreHealthDuration.GetValue() as int
	int RestoreMDur = CACO_RestoreMagickaDuration.GetValue() as int
	int RestoreSDur = CACO_RestoreStaminaDuration.GetValue() as int	
	int DamageHDur = CACO_DamageHealthDuration.GetValue() as int
	int DamageMDur = CACO_DamageMagickaDuration.GetValue() as int
	int DamageSDur = CACO_DamageStaminaDuration.GetValue() as int	
	UpdatePotionDuration(RestoreHDur, AlchRestoreHealth_1sec, AlchRestoreHealth_5sec, AlchRestoreHealth_10sec)
	UpdatePotionDuration(RestoreHDur, AlchRestoreHealthBlood_1sec, AlchRestoreHealthBlood_5sec, AlchRestoreHealthBlood_10sec)
	UpdatePotionDuration(RestoreMDur, AlchRestoreMagicka_1sec, AlchRestoreMagicka_5sec, AlchRestoreMagicka_10sec)
	UpdatePotionDuration(RestoreSDur, AlchRestoreStamina_1sec, AlchRestoreStamina_5sec, AlchRestoreStamina_10sec)
	UpdatePotionDuration(DamageHDur, AlchDamageHealth_1sec, AlchDamageHealth_5sec, AlchDamageHealth_10sec)
	UpdatePotionDuration(DamageHDur, AlchDamageUndead_1sec, AlchDamageUndead_5sec, AlchDamageUndead_10sec)
	UpdatePotionDuration(DamageMDur, AlchDamageMagicka_1sec, AlchDamageMagicka_5sec, AlchDamageMagicka_10sec)	
	UpdatePotionDuration(DamageSDur, AlchDamageStamina_1sec, AlchDamageStamina_5sec, AlchDamageStamina_10sec)		
	UpdateModIngredients(CACO_IngrDamageHealth1st, CACO_DamageIngH1st, 0, DamageHDur, LastDamH01, 1)
	UpdateModIngredients(CACO_IngrDamageHealth2nd, CACO_DamageIngH2nd, 1, DamageHDur, LastDamH02, 1)
	UpdateModIngredients(CACO_IngrDamageHealth3rd, CACO_DamageIngH3rd, 2, DamageHDur, LastDamH03, 1)	
	UpdateModIngredients(CACO_IngrDamageHealth4th, CACO_DamageIngH4th, 3, DamageHDur, LastDamH04, 1)
	UpdateModIngredients(CACO_IngrDamageMagicka1st, CACO_DamageIngM1st, 0, DamageMDur, LastDamM01, 1)
	UpdateModIngredients(CACO_IngrDamageMagicka2nd, CACO_DamageIngM2nd, 1, DamageMDur, LastDamM02, 1)
	UpdateModIngredients(CACO_IngrDamageMagicka3rd, CACO_DamageIngM3rd, 2, DamageMDur, LastDamM03, 1)
	UpdateModIngredients(CACO_IngrDamageMagicka4th, CACO_DamageIngM4th, 3, DamageMDur, LastDamM04, 1)
	UpdateModIngredients(CACO_IngrDamageStamina1st, CACO_DamageIngS1st, 0, DamageSDur, LastDamS01, 1)
	UpdateModIngredients(CACO_IngrDamageStamina2nd, CACO_DamageIngS2nd, 1, DamageSDur, LastDamS02, 1)
	UpdateModIngredients(CACO_IngrDamageStamina3rd, CACO_DamageIngS3rd, 2, DamageSDur, LastDamS03, 1)
	UpdateModIngredients(CACO_IngrDamageStamina4th, CACO_DamageIngS4th, 3, DamageSDur, LastDamS04, 1)
	UpdateModIngredients(CACO_IngrRestoreHealth1st, CACO_RestoreIngH1st, 0, RestoreHDur, LastResH01, 0)
	UpdateModIngredients(CACO_IngrRestoreHealth2nd, CACO_RestoreIngH2nd, 1, RestoreHDur, LastResH02, 0)
	UpdateModIngredients(CACO_IngrRestoreHealth3rd, CACO_RestoreIngH3rd, 2, RestoreHDur, LastResH03, 0)
	UpdateModIngredients(CACO_IngrRestoreHealth4th, CACO_RestoreIngH4th, 3, RestoreHDur, LastResH04, 0)
	UpdateModIngredients(CACO_IngrRestoreMagicka1st, CACO_RestoreIngM1st, 0, RestoreMDur, LastResM01, 0)
	UpdateModIngredients(CACO_IngrRestoreMagicka2nd, CACO_RestoreIngM2nd, 1, RestoreMDur, LastResM02, 0)
	UpdateModIngredients(CACO_IngrRestoreMagicka3rd, CACO_RestoreIngM3rd, 2, RestoreMDur, LastResM03, 0)
	UpdateModIngredients(CACO_IngrRestoreMagicka4th, CACO_RestoreIngM4th, 3, RestoreMDur, LastResM04, 0)
	UpdateModIngredients(CACO_IngrRestoreStamina1st, CACO_RestoreIngS1st, 0, RestoreSDur, LastResS01, 0)
	UpdateModIngredients(CACO_IngrRestoreStamina2nd, CACO_RestoreIngS2nd, 1, RestoreSDur, LastResS02, 0)
	UpdateModIngredients(CACO_IngrRestoreStamina3rd, CACO_RestoreIngS3rd, 2, RestoreSDur, LastResS03, 0)
	UpdateModIngredients(CACO_IngrRestoreStamina4th, CACO_RestoreIngS4th, 3, RestoreSDur, LastResS04, 0)
	CACOQuest.FixIngConsumeFunction() ; Call ingredient fix on player load
endFunction


;iNeed Food Compatibility Lists
Function UpdateFormLists(FormList ModList, FormList CACOList)
	Int iPos = CACOList.GetSize() 
	While iPos
		iPos -= 1
		Form CurrentItem = CACOList.GetAt(iPos) As Form
		if !ModList.HasForm(CurrentItem)
			ModList.AddForm(CurrentItem)	
		endif	
	EndWhile
endFunction

;iNeed water compatibility
Function UpdateiNeedWaterCompatibility()
	WaterskinList.AddForm(Game.GetFormFromFile(0x0200438C, "iNeed.esp"))		;empty waterskin
	WaterskinList.AddForm(Game.GetFormFromFile(0x0200437F, "iNeed.esp"))		; waterskin 1/3
	WaterskinList.AddForm(Game.GetFormFromFile(0x0200437D, "iNeed.esp"))		;waterskin 2/3
	WaterskinList.AddForm(Game.GetFormFromFile(0x02004376, "iNeed.esp"))		;NOT TRUE: add Waterskin 3/3 first...'AddForm' adds the new form at the 0th index, adding 1 to the indices of the other list entries. 
EndFunction

Function UpdateiNeedFoodCompatibility()
	HeavyFood = Game.GetFormFromFile(0x02000D69, "iNeed.esp") as FormList
	MedFood = Game.GetFormFromFile(0x02000D6C, "iNeed.esp") as FormList
	LightFood = Game.GetFormFromFile(0x02000D6B, "iNeed.esp") as FormList
	NoSpoilFood = Game.GetFormFromFile(0x020346FA, "iNeed.esp") as FormList	
	SoupFood = Game.GetFormFromFile(0x0204B599, "iNeed.esp") as FormList
	RawFood = Game.GetFormFromFile(0x02000D6A, "iNeed.esp") as FormList	
	DrinkFood = Game.GetFormFromFile(0x02000D68, "iNeed.esp") as FormList
	DrinkNoAlcFood = Game.GetFormFromFile(0x0200BA28, "iNeed.esp") as FormList
	IgnoreFood = Game.GetFormFromFile(0x0203E351, "iNeed.esp") as FormList
	UpdateFormLists(HeavyFood, CACOHeavyFoodList)
	UpdateFormLists(MedFood, CACOMedFoodList)
	UpdateFormLists(LightFood, CACOLightFoodList)
	UpdateFormLists(NoSpoilFood, CACONoSpoilFoodList)
	UpdateFormLists(SoupFood, CACOSoupFoodList)	
	UpdateFormLists(RawFood, CACORawFoodList)
	UpdateFormLists(DrinkFood, CACODrinkFoodList)		
	UpdateFormLists(DrinkNoAlcFood, CACODrinkNoAlcFoodList)	
	UpdateFormLists(IgnoreFood, CACOIgnoreList)
EndFunction


Function UpdateModIngredients(LeveledItem LvlList, FormList IngrFormList, int ieffect, int iduration, int SaveListAmt, int isDamage)
	if iduration == 2
		fxduration = 20 / (isDamage + 1) ;schofida - update duration
	elseif iduration == 1
		fxduration = 10 / (isDamage + 1) ;schofida - update duration
	else
		fxduration = 1
	endif
	If SaveListAmt != LvlList.GetNumForms() as int
		iIngr = LvlList.GetNumForms()
		SaveListAmt = iIngr
		While iIngr >= 0
			Form CurrentItem = LvlList.GetNthForm(iIngr) As Form
			if !IngrFormList.HasForm(CurrentItem)
				IngrFormList.AddForm(CurrentItem)	
			endif		
			iIngr -= 1
		EndWhile	
	endif
	iIngr = IngrFormList.GetSize() as int
	While iIngr >= 1
		iIngr -= 1
		Ingredient CurrentIng = IngrFormList.GetAt(iIngr) as Ingredient
		int factor = 1
		int factorIndex = REQ_CACO_SpecialIngrs.Find(CurrentIng)
		if (factorIndex > -1)
			factor = REQ_CACO_SpecialIngrsMultiplier[factorIndex]
		endif
		(CurrentIng as Ingredient).SetNthEffectDuration(ieffect, fxduration * factor)
	endWhile		
EndFunction


Function UpdatePotionDuration(int RestoreMDur, MagicEffect effect1sec, MagicEffect effect5sec, MagicEffect effect10sec)
		if RestoreMDur == 0
			effect1sec.ClearEffectFlag(0x00008000)
			effect5sec.SetEffectFlag(0x00008000)		
			effect10sec.SetEffectFlag(0x00008000)	
		elseif RestoreMDur == 1
			effect1sec.SetEffectFlag(0x00008000)
			effect5sec.ClearEffectFlag(0x00008000)		
			effect10sec.SetEffectFlag(0x00008000)
		else
			effect1sec.SetEffectFlag(0x00008000)
			effect5sec.SetEffectFlag(0x00008000)		
			effect10sec.ClearEffectFlag(0x00008000)		
		endif
EndFunction		





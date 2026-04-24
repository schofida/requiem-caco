Scriptname CACO_CreatePotionPlayerScript extends ReferenceAlias  
{schofida - Original script from Complete Alchemy & Cooking Overhaul version 2.0 by kryptopyr
	- Call ingredient fix from CACOQuest with CACO Ingredient magnitudes when making potions
	  so that potion strength is not affected. Set back to configured mags when you close the Alchemy Crafting
	  This is to make ingredient strength for variable durations balance out
	  Also, hook into process to add counts for new perk conditions (Registerformenu stuff)
}
Quest property AdjustPotionQuest auto
keyword property WICraftingAlchemy auto
Actor Property PlayerRef Auto
ObjectReference furn
ObjectReference Property CreatedPotionContainer Auto
GlobalVariable Property CACO_RenamePotions Auto
GlobalVariable Property CACO_DamageHealthDuration Auto
GlobalVariable Property CACO_DamageMagickaDuration Auto
GlobalVariable Property CACO_DamageStaminaDuration Auto
GlobalVariable Property CACO_RestoreHealthDuration Auto
GlobalVariable Property CACO_RestoreMagickaDuration Auto
GlobalVariable Property CACO_RestoreStaminaDuration Auto
keyword property VendorItemPotion auto
keyword property VendorItemPoison auto
Formlist Property PotionList Auto
ObjectReference Property PotionContainer Auto
Form CurrentItem
int iVersion
;schofida - new form params
CACO_MCMScript property CACOQuest auto
Float[] property REQ_CACO_CACOIngrMags auto
keyword property WICraftingTanningRack auto
keyword property WICraftingRetort auto
Faction property REQ_CACO_FactionHealingPoultice auto
Faction property REQ_CACO_FactionWaxes01 auto
Faction property REQ_CACO_FactionWaxes02 auto
FormList property REQ_CACO_FormListHealingPoultice auto
FormList property REQ_CACO_FormListWaxes01 auto
FormList property REQ_CACO_FormListWaxes02 auto

Event OnPlayerLoadGame() 
	RegisterForModEvent("CACO_OnPotionCreation", "OnPotionCreation")
	RegisterForMenu("Crafting Menu")	
	int ListSize = PotionList.GetSize()
	int MovedItems = 0
	while MovedItems < ListSize               
		CurrentItem = PotionList.GetAt(MovedItems)
		int ItemCount = PlayerREF.GetItemCount(CurrentItem)
		PlayerREF.RemoveItem(CurrentItem, ItemCount, true, akOtherContainer = PotionContainer)
		MovedItems += 1
	endwhile
	PotionContainer.RemoveAllItems(akTransferTo = PlayerRef)
	PotionList.Revert()
	if iVersion < 3
		CACO_DamageHealthDuration = Game.GetFormFromFile(0x01CCA013, "Update.esm") as GlobalVariable
		CACO_DamageMagickaDuration = Game.GetFormFromFile(0x01CCA014, "Update.esm") as GlobalVariable
		CACO_DamageStaminaDuration = Game.GetFormFromFile(0x01CCA015, "Update.esm") as GlobalVariable
		CACO_RestoreHealthDuration = Game.GetFormFromFile(0x01CCA010, "Update.esm") as GlobalVariable
		CACO_RestoreMagickaDuration = Game.GetFormFromFile(0x01CCA011, "Update.esm") as GlobalVariable
		CACO_RestoreStaminaDuration = Game.GetFormFromFile(0x01CCA012, "Update.esm") as GlobalVariable
		iVersion = 3
	endif
	GoToState("")
EndEvent

;schofida - addition
Event Init()
	RegisterForMenu("Crafting Menu")	
EndEvent

Event OnSit(ObjectReference akFurniture)
	if akFurniture.HasKeyWord(WICraftingAlchemy)
		CACOQuest.FixIngConsumeFunction(REQ_CACO_CACOIngrMags) ; schofida - set ingr magnitude to CACO
		GoToState("Crafting")
		furn = akFurniture
	else
		GoToState("")
		furn = none
	endIf
EndEvent

Event OnGetUp(ObjectReference akFurniture)
	GoToState("")
	furn = none
	if akFurniture.HasKeyWord(WICraftingAlchemy)	
		CACOQuest.FixIngConsumeFunction() ; schofida - set ingr magnitude back to configured globals
	endif
	;if akFurniture.HasKeyWord(WICraftingAlchemy)	
	;	debug.notification("Moving Potions to Container")
	;	int ListSize = PotionList.GetSize()
	;	int MovedItems = 0
	;	while MovedItems < ListSize               
	;		CurrentItem = PotionList.GetAt(MovedItems)
	;		int ItemCount = PlayerREF.GetItemCount(CurrentItem)
	;		PlayerREF.RemoveItem(CurrentItem, ItemCount, true, akOtherContainer = PotionContainer)
	;		MovedItems += 1
	;	endwhile
	;	PotionContainer.RemoveAllItems(akTransferTo = PlayerRef)
	;	PotionList.Revert()	
	;	debug.notification("Potions moved back to Player")		
	;endif

	;CreatedPotionContainer.RemoveAllItems(akTransferTo = PlayerRef)
	;debug.notification("Potions transferred to player")
	;Utility.Wait(5.0)
	;Int iItems = CreatedPotionContainer.GetNumItems()
	;While iItems > 0
	;	CreatedPotionContainer.RemoveAllItems(akTransferTo = PlayerRef)
	;	Utility.Wait(5.0)
	;	iItems = CreatedPotionContainer.GetNumItems()
	;EndWhile
	;debug.notification("All potions have been transferred to player")
endEvent

;schofida - addition
Event OnMenuOpen(string sMenuName)
	if furn == none && sMenuName == "Crafting Menu"
		GoToState("CraftingMenu")
	endif
EndEvent
;schofida - addition
Event OnMenuClose(string sMenuName)
	if furn == none && sMenuName == "Crafting Menu"
		GoToState("")
	endif
EndEvent

State Crafting
Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if furn == none
		GoToState("")
	;the following section of script was modified in Version 1.2 for compatibility with mods like Ordinator, which allow for the creation of multiple potions at once.  Changes suggested by ServantOfSin.
	elseif akItemReference == none && akSourceContainer == none && aiItemCount >= 1
		if akBaseItem.HasKeyWord(VendorItemPotion) || akBaseItem.HasKeyWord(VendorItemPoison)
			CACO_AdjustPotionThreadManager threadmgr = AdjustPotionQuest as CACO_AdjustPotionThreadManager    
			int potionIndex = 0									
			while potionIndex < aiItemCount								
				threadmgr.AdjustPotionAsync(akBaseItem as Potion, CACO_DamageHealthDuration.GetValueInt(), CACO_DamageMagickaDuration.GetValueInt(), CACO_DamageStaminaDuration.GetValueInt(), CACO_RestoreHealthDuration.GetValueInt(), CACO_RestoreMagickaDuration.GetValueInt(), CACO_RestoreStaminaDuration.GetValueInt())		
				potionIndex += 1
			endwhile
			threadmgr.wait_all()
		endif    
	endif  	
EndEvent
EndState

;schofida - Track items created for new perks
State CraftingMenu
Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akItemReference == none && akSourceContainer == none && aiItemCount >= 1 && REQ_CACO_FormListHealingPoultice.HasForm(akBaseItem)
		int rank = PlayerRef.GetFactionRank(REQ_CACO_FactionHealingPoultice)
		if rank < 0
			rank = 0
		endif
		PlayerREF.SetFactionRank(REQ_CACO_FactionHealingPoultice, rank + aiItemCount)
	elseif akItemReference == none && akSourceContainer == none && aiItemCount >= 1 && REQ_CACO_FormListWaxes01.HasForm(akBaseItem)
		int rank = PlayerRef.GetFactionRank(REQ_CACO_FactionWaxes01)
		if rank < 0
			rank = 0
		endif
		PlayerREF.SetFactionRank(REQ_CACO_FactionWaxes01, rank + aiItemCount)
	elseif akItemReference == none && akSourceContainer == none && aiItemCount >= 1 && REQ_CACO_FormListWaxes02.HasForm(akBaseItem)
		int rank = PlayerRef.GetFactionRank(REQ_CACO_FactionWaxes02)
		if rank < 0
			rank = 0
		endif
		PlayerREF.SetFactionRank(REQ_CACO_FactionWaxes02, rank + aiItemCount)
	endif
EndEvent
EndState

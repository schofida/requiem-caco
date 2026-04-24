Scriptname REQ_CACO_ReadBookScript extends ObjectReference  

Book Property ThisRecipe Auto
FormList Property CACO_AlchemyRecipesRead Auto
GlobalVariable Property CACO_OptionNotesLearnEffects Auto
bool Property NoValueAfterRead Auto
GlobalVariable Property REQ_CACO_Global
int iLearnedSomething

Auto STATE StartState
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		If ThisRecipe.IsRead()
			GotoState("AlreadyRead")
		else	
			GotoState("WaitingToBeRead")
		endif
	endif
	EndEvent
EndState


STATE WaitingToBeRead
	Event OnRead()
		If CACO_OptionNotesLearnEffects.GetValue() == 1
			iLearnedSomething = 1
      REQ_CACO_Global.SetValue(1)
      debug.notification("This book has inspired me to think of some new cooking recipes.")
		endif
		if NoValueAfterRead
			if iLearnedSomething == 1
				ThisRecipe.SetGoldValue(0)		;need to store this change as part of a maintanence script, it will not persist across saves.
			endif
			CACO_AlchemyRecipesRead.AddForm(ThisRecipe)
		endif	
		GotoState("AlreadyRead")
	EndEvent
EndState


STATE AlreadyRead
	Event OnRead()
		;debug.notification("You've already read this book.")
	EndEvent		
endState

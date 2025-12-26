ScriptName FavorJobsGatherWheatScript extends Quest
;Modified by Complete Alchemy & Cooking Overhaul

;Schofida - Added mulitpliers as Requiem farm jobs are more lucrative

Ingredient Property Wheat Auto
Potion Property Gourd Auto
Ingredient Property Nirnroot Auto
Potion Property FoodPotato Auto
Potion Property FoodCabbage Auto
Potion Property FoodLeek Auto
Int Property PlayerCropCount Auto
Int Property PlayerGoldReward Auto
MiscObject Property pGold Auto

GlobalVariable Property CACO_JobFarmCabbageAmt Auto
GlobalVariable Property CACO_JobFarmGourdAmt Auto
GlobalVariable Property CACO_JobFarmLeekAmt Auto
GlobalVariable Property CACO_JobFarmNirnrootAmt Auto
GlobalVariable Property CACO_JobFarmPotatoAmt Auto
GlobalVariable Property CACO_JobFarmWheatAmt Auto

Function SellWheat(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(Wheat)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	;PlayerGoldReward = (PlayerCropCount * (Wheat.GetGoldValue()))
	PlayerGoldReward = (PlayerCropCount / CACO_JobFarmWheatAmt.GetValue() as int) 			;added by CACO
		
	Game.GetPlayer().RemoveItem(Wheat, (PlayerGoldReward*CACO_JobFarmWheatAmt.GetValue() as int))
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellPotato(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(FoodPotato)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	;PlayerGoldReward = (PlayerCropCount * (FoodPotato.GetGoldValue()))
	PlayerGoldReward = (PlayerCropCount / CACO_JobFarmPotatoAmt.GetValue() as int) 			;added by CACO
		
	Game.GetPlayer().RemoveItem(FoodPotato, (PlayerGoldReward*CACO_JobFarmPotatoAmt.GetValue() as int))
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellLeek(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(FoodLeek)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	;PlayerGoldReward = (PlayerCropCount * (FoodLeek.GetGoldValue()))
	PlayerGoldReward = (PlayerCropCount / CACO_JobFarmLeekAmt.GetValue() as int) 			;added by CACO	
		
	Game.GetPlayer().RemoveItem(FoodLeek, (PlayerGoldReward*CACO_JobFarmLeekAmt.GetValue() as int))
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellGourd(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(Gourd)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (((PlayerCropCount * 5) / CACO_JobFarmGourdAmt.GetValue()) as int) 			;added by CACO	
	;Schofida change. Added mulitpliers as Requiem farm jobs are more lucrative
	Game.GetPlayer().RemoveItem(Gourd, ((PlayerGoldReward*CACO_JobFarmGourdAmt.GetValue() / 5) as int))

	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellCabbage(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(FoodCabbage)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (((PlayerCropCount * 3) / CACO_JobFarmCabbageAmt.GetValue()) as int) 			;added by CACO	
	;Schofida change. Added mulitpliers as Requiem farm jobs are more lucrative
	Game.GetPlayer().RemoveItem(FoodCabbage, ((PlayerGoldReward*CACO_JobFarmCabbageAmt.GetValue() / 3) as int))
	
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction

Function SellNirnroot(Actor Foreman)

	;Count the amount of wheat the player has
	PlayerCropCount = Game.GetPlayer().GetItemCount(Nirnroot)
		
	;Make the Foreman the player's friend
	If Foreman.GetRelationshipRank(Game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(Game.GetPlayer(), 1)
	EndIf
			
	;Calculate the amount of gold to give the player
	PlayerGoldReward = (((PlayerCropCount * 50) / CACO_JobFarmNirnrootAmt.GetValue()) as int) 			;added by CACO	
	;Schofida change. Added mulitpliers as Requiem farm jobs are more lucrative
	Game.GetPlayer().RemoveItem(Nirnroot, ((PlayerGoldReward*CACO_JobFarmNirnrootAmt.GetValue() / 50) as int))
	
	Game.GetPlayer().AddItem(pGold, PlayerGoldReward)
			
EndFunction
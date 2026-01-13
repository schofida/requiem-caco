zedit.GetSelectedRecords().forEach(record => {
  if (xelib.HasElement(record, 'CNAM') && 
    (xelib.GetValue(record, 'BNAM') === 'CraftingCookpot [KYWD:000A5CB3]' || xelib.GetValue(record, 'BNAM') === 'BYOHCraftingOven [KYWD:030117F7]')) {
      let advanced = false;
      if (xelib.HasElement(record, 'Conditions')) {
        xelib.GetElements(record, 'Conditions').forEach(cond => {
          if (xelib.GetValue(cond, 'CTDA\\Comparison Value') === 'CACO_FoodCookingSkillApprentice [GLOB:01CCA032]' || 
            xelib.GetValue(cond, 'CTDA\\Comparison Value') === 'CACO_FoodCookingSkillAdept [GLOB:01CCA033]' || 
            xelib.GetValue(cond, 'CTDA\\Comparison Value') === 'CACO_FoodCookingSkillExpert [GLOB:01CCA034]' || 
            xelib.GetValue(cond, 'CTDA\\Comparison Value') === 'CACO_FoodCookingSkillMaster [GLOB:01CCA035]') {
            advanced = true;
          }
        });
      }
      if (!advanced) {
        let logStr = xelib.LongName(record) + '|';
        xelib.GetElements(record, 'Items').forEach(item => {
          logStr += xelib.GetValue(item, 'CNTO\\Item') + ':' + xelib.GetValue(item, 'CNTO\\Count') + ';';
        });
        logStr = logStr.substring(0, logStr.length -1) + '|';
        let alch = xelib.GetWinningOverride(xelib.GetLinksTo(record, 'CNAM'))
        logStr += xelib.LongName(alch) + '|';
        logStr += xelib.GetValue(alch, 'ENIT\\Value') + '|';  
        if (xelib.HasElement(alch, 'Effects')) {
          xelib.GetElements(alch, 'Effects').forEach(effect => {
            logStr += xelib.GetValue(effect, 'EFID') + ':' + xelib.GetValue(effect, 'EFIT\\Magnitude') + ':' + xelib.GetValue(effect, 'EFIT\\Duration') + ';';
          });  
        }  
        logStr = logStr.substring(0, logStr.length -1);  
        zedit.log(logStr);
      }
  }
})
//CACO_FoodCookingSkillApprentice [GLOB:01CCA032]
//CACO_FoodCookingSkillAdept [GLOB:01CCA033]
//CACO_FoodCookingSkillExpert [GLOB:01CCA034]
//CACO_FoodCookingSkillMaster [GLOB:01CCA035]
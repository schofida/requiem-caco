xelib.GetLoadedFileNames(true).forEach(fileName => {
    const file = xelib.FileByName(fileName);
    xelib.GetRecords(file, 'ALCH', false).forEach(record => {
       if (xelib.IsMaster(record) && xelib.GetFlag(record, 'ENIT\\Flags', 'Food Item')) {
        zedit.log(xelib.LongName(record));
        let logStr = xelib.GetFileName(xelib.GetElementFile(record)) + '|value:' + xelib.GetValue(record, 'ENIT\\Value') + '|effects:';
        if (xelib.HasElement(record, 'Effects')) {
            xelib.GetElements(record, 'Effects').forEach(effect => {
                logStr += xelib.GetValue(effect, 'EFID') + ':' + xelib.GetValue(effect, 'EFIT\\Magnitude') + ':' + xelib.GetValue(effect, 'EFIT\\Duration') + ';';
            });  
        }  
        zedit.log(logStr);
        xelib.GetOverrides(record).forEach(override => {
            let logStr = xelib.GetFileName(xelib.GetElementFile(override)) + '|value:' + xelib.GetValue(override, 'ENIT\\Value') + '|effects:';
            if (xelib.HasElement(override, 'Effects')) {
                xelib.GetElements(override, 'Effects').forEach(effect => {
                    logStr += xelib.GetValue(effect, 'EFID') + ':' + xelib.GetValue(effect, 'EFIT\\Magnitude') + ':' + xelib.GetValue(effect, 'EFIT\\Duration') + ';';
                });  
            }
            zedit.log(logStr);          
        });
        xelib.GetReferencedBy(record).forEach(ref => {
            if (xelib.Signature(ref) === 'COBJ' && xelib.HasElement(ref, 'CNAM') && xelib.GetLinksTo(ref, 'CNAM') && xelib.GetHexFormID(xelib.GetLinksTo(ref, 'CNAM')) === xelib.GetHexFormID(record)) {
                    let logStr = xelib.GetFileName(xelib.GetElementFile(ref)) + '|recipe:';
                    xelib.GetElements(ref, 'Items').forEach(item => {
                        logStr += xelib.GetValue(item, 'CNTO\\Item') + ':' + xelib.GetValue(item, 'CNTO\\Count') + ';';
                    });
                    if (xelib.HasElement(ref, 'Conditions')) {
                        xelib.GetElements(ref, 'Conditions').forEach(cond => {
                          if (xelib.GetValue(cond, 'CTDA\\Comparison Value') === 'CACO_FoodCookingSkillApprentice [GLOB:01CCA032]' || 
                            xelib.GetValue(cond, 'CTDA\\Comparison Value') === 'CACO_FoodCookingSkillAdept [GLOB:01CCA033]' || 
                            xelib.GetValue(cond, 'CTDA\\Comparison Value') === 'CACO_FoodCookingSkillExpert [GLOB:01CCA034]' || 
                            xelib.GetValue(cond, 'CTDA\\Comparison Value') === 'CACO_FoodCookingSkillMaster [GLOB:01CCA035]') {
                            logStr += '|Advanced:' + xelib.GetValue(cond, 'CTDA\\Comparison Value');
                          }
                        });
                      }
                    zedit.log(logStr); 
            }
        });
        zedit.log('');
       } 
    });
  })
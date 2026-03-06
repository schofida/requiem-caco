const cacoFile = xelib.FileByName('Complete Alchemy & Cooking Overhaul.esp');
const reqCACOFile = xelib.FileByName('Requiem - CACO.esp');
const reqARFile = xelib.FileByName('Requiem - Alchemy Redone.esp');
const reqDBFile = xelib.FileByName('Fozars_Dragonborn_-_Requiem_Patch.esp');
const reqFile = xelib.FileByName('Requiem.esp');
const updateFile = xelib.FileByName('Update.esm');
const cacoSurvival = xelib.FileByName('caco_survival mode_ussep_patch.esp');
const cacoFishing = xelib.FileByName('CC-Fishing_CACO_Patch.esp');
const skyrimFile = xelib.FileByName('Skyrim.esm');

const Survival_FoodRestoreHungerLarge = xelib.GetElement(updateFile, "01002EE4");
const Survival_FoodRestoreHungerMedium = xelib.GetElement(updateFile, "01002EE3");
const Survival_FoodRestoreHungerSmall = xelib.GetElement(updateFile, "01002EE2");
const Survival_FoodRestoreHungerVerySmall = xelib.GetElement(updateFile, "01002EE1");
const Survival_FoodFortifyWarmth = xelib.GetElement(updateFile, "01002EE6");
const Survival_FoodRestoreCold  = xelib.GetElement(updateFile, "01002EE5");

const REQ_Effect_Food_DamageAttributes = xelib.GetElement(reqFile, "5304A316");

const FoodBlankEffect = xelib.GetElement(cacoFile, "502F8742");
const KRYGhostveilTEST = xelib.GetElement(cacoFile, "5004C7FA");
const beerEffect = xelib.GetElement(cacoFile, "5044BC98");

const SublistInnCookedMeal_KRY = xelib.GetElement(reqCACOFile, "50892091");

const REQ_DisableRecipe = xelib.GetElement(reqFile, "53AD3B01");


const CACO_FoodWaterEffect = xelib.GetElement(cacoFile, "502F8742");

const Chef1 = xelib.GetElement(reqCACOFile, "000C07CB");
const Chef2 = xelib.GetElement(reqCACOFile, "00105F2A");

const cookingLevel = "01CCA030";
const enableCookLevel = xelib.GetElement(updateFile, "01CCA031");
const apprenticeLvl = "01CCA032";
const adeptLvl = "01CCA033";
const expertLvl = "01CCA034";
const masterLvl = "01CCA035";

const rawFood = xelib.GetElement(skyrimFile, "000A0E56");

const salt = xelib.GetElement(updateFile, '01CCA101');


let food = {};
let magicEffects = {};

xelib.GetRecords(reqFile, 'ALCH', true).forEach(record => {
    food[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});
xelib.GetRecords(cacoFile, 'ALCH', true).forEach(record => {
    food[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});
xelib.GetRecords(cacoSurvival, 'ALCH', true).forEach(record => {
    food[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});
xelib.GetRecords(cacoFishing, 'ALCH', true).forEach(record => {
    food[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});

xelib.GetRecords(reqFile, 'MGEF', true).forEach(record => {
    magicEffects[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});
xelib.GetRecords(cacoFile, 'MGEF', true).forEach(record => {
    magicEffects[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});
xelib.GetRecords(cacoSurvival, 'MGEF', true).forEach(record => {
    magicEffects[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});
xelib.GetRecords(cacoFishing, 'MGEF', true).forEach(record => {
    magicEffects[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});

xelib.RemoveElement(SublistInnCookedMeal_KRY, 'Leveled List Entries');
xelib.AddElement(SublistInnCookedMeal_KRY, 'Leveled List Entries');

const funcSurvivalAdd = (reqCacoFood, effect) => {
    let newSurvivalEffect = xelib.AddArrayItem(reqCacoFood, 'Effects', 'EFIT\\Magnitude', '0');
    xelib.SetIntValue(newSurvivalEffect, 'EFIT\\Magnitude', 0);
    xelib.SetLinksTo(newSurvivalEffect, effect, 'EFID');
}

const cacoEffectAdd = (reqCacoFood, effect, duration, magnitude) => {
    let newCACOEffect = xelib.AddArrayItem(reqCacoFood, 'Effects', 'EFIT\\Magnitude', magnitude);
    xelib.SetIntValue(newCACOEffect, 'EFIT\\Duration', duration);
    xelib.SetLinksTo(newCACOEffect, effect, 'EFID');
}

const updateReferences = (references, type, removedFood, reqCacoFood) => {
    zedit.log(references.length.toString());
    references.forEach(reference => {
        //if (xelib.GetFileName(xelib.GetElementFile(reference)) !== 'Complete Alchemy & Cooking Overhaul.esp') {
        //    return;
        //}
        const keepGoing = ((xelib.GetFileName(xelib.GetElementFile(reference)).indexOf('CACO') > -1 && xelib.GetFileName(xelib.GetElementFile(reference)).indexOf('CC') > -1)
        || xelib.GetFileName(xelib.GetElementFile(reference)) === 'CACO_Survival Mode_Patch.esp'
        || xelib.GetFileName(xelib.GetElementFile(reference)) === 'CACO Rare Curios Patch.esp'
        || xelib.GetFileName(xelib.GetElementFile(reference)) === 'CACO_Saints&Seducers.esp'
        || xelib.GetFileName(xelib.GetElementFile(reference)) === 'Complete Alchemy & Cooking Overhaul.esp');
        if (!keepGoing ||  xelib.GetFileName(xelib.GetElementFile(reference)).indexOf('Requiem - CACO') > -1) {
            return;
        }
        if (xelib.Signature(reference) === 'COBJ') {
            zedit.log('Goes Here 1');
            const newRef = xelib.CopyElement(reference, reqCACOFile, false);
            zedit.log('Goes Here 2');
            if (removedFood) {
                xelib.SetValue(newRef, 'EDID', 'XXX_' + xelib.GetValue(reference, 'EDID'));
                xelib.SetLinksTo(newRef, 'BNAM', REQ_DisableRecipe);
            } else if(xelib.GetElements(reference, 'Items').length === 1 && xelib.HasKeyword(xelib.GetLinksTo(xelib.GetElements(reference, 'Items')[0], 'CNTO\\Item'), xelib.LongName(rawFood))) {
                xelib.CopyElement(xelib.GetElement(reference, 'Items'), newRef, false);
                xelib.AddItem(newRef, xelib.LongName(salt), '1');
            }
            if (!removedFood) {
                xelib.SetElement(xelib.GetElement(newRef, 'BNAM'), xelib.GetElement(reference, 'BNAM')); 
                const master =  xelib.GetMasterRecord(reference);
                const overrides = [master].concat(xelib.GetOverrides(master));
                let reqRecord;
                overrides.forEach(override => {
                    if (xelib.GetFileName(xelib.GetElementFile(override)) === 'Requiem.esp' || xelib.GetFileName(xelib.GetElementFile(override)) === 'Fozars_Dragonborn_-_Requiem_Patch.esp') {
                        reqRecord = override; 
                    }
                })
                if (reqRecord) {
                    xelib.SetValue(newRef, 'EDID', xelib.GetValue(reqRecord, 'EDID'));   
                } else {
                    xelib.SetValue(newRef, 'EDID', xelib.GetValue(reference, 'EDID'));   
                }
                if (type === 3 && xelib.GetValue(reference, 'NAM1') === '4') {
                    xelib.SetValue(newRef, 'NAM1', '3');
                }     
            }
            zedit.log('Goes Here 3');
            if (xelib.HasElement(reference, 'Conditions')) {
                xelib.CopyElement(xelib.GetElement(reference, 'Conditions'), newRef, 'Conditions', false);
                xelib.GetElements(newRef, 'Conditions').forEach(condition => {
                    if (xelib.GetValue(condition, 'CTDA\\Function') !== 'GetGlobalValue' || xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Parameter #1')) !== cookingLevel) {
                        return;
                    }
                    if (xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Comparison Value')) === apprenticeLvl || 
                    xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Comparison Value')) === expertLvl || 
                    xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Comparison Value')) === adeptLvl) {
                        xelib.SetValue(condition, 'CTDA\\Type', '10000000');
                        xelib.SetIntValue(condition, 'CTDA\\Comparison Value', 1);
                        xelib.SetValue(condition, 'CTDA\\Function', 'HasPerk');
                        xelib.SetLinksTo(condition, 'CTDA\\Perk', Chef1);                               
                    } else if (xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Comparison Value')) === masterLvl) {
                        xelib.SetValue(condition, 'CTDA\\Type', '10000000');
                        xelib.SetIntValue(condition, 'CTDA\\Comparison Value', 1);
                        xelib.SetValue(condition, 'CTDA\\Function', 'HasPerk');
                        xelib.SetLinksTo(condition, 'CTDA\\Perk', Chef2); 
                    }
                });
            }
            zedit.log('Goes Here 4');
        }
        zedit.log('Goes Here 5');
        if (xelib.Signature(reference) === 'LVLI' && removedFood && xelib.HasLeveledEntry(reference, xelib.LongName(reqCacoFood))) {
            zedit.log('Goes Here 6');
            const newRef = xelib.CopyElement(reference, reqCACOFile, false);
            xelib.RemoveLeveledEntry(newRef, xelib.LongName(reqCacoFood))
            zedit.log('Goes Here 7');
        }
    });
}

let magicArray = [];

fh.loadTextFile('C:\\Users\\schof\\Downloads\\Untitled spreadsheet - REQ CACO (6).csv','').toString().split(/\r?\n/).forEach(line => {
    const textArray = line.split(',');
    const editorID = textArray[0].split(" ")[0].replaceAll('\"','');
    zedit.log(editorID);
    if (editorID === 'name') {
        magicArray = textArray;
        return;
    }
    let record = food[editorID];
    const type = parseInt(textArray[1]);
    const level = textArray[2];
    if (!record || type === NaN) {
        return;
    }
    if (type === -2) {
        xelib.RemoveElement(reqCACOFile, editorID);
        return;
    }   
    const overrides = [record].concat(xelib.GetOverrides(record));
    let cacoFood;
    let reqFood;
    overrides.forEach(override => {
        if ((xelib.GetFileName(xelib.GetElementFile(override)) === 'Complete Alchemy & Cooking Overhaul.esp' || (xelib.GetFileName(xelib.GetElementFile(override)).indexOf('CACO') > -1)) && (xelib.GetFileName(xelib.GetElementFile(override)).indexOf('Requiem - CACO') === -1)) {
            cacoFood = override;
        } else if (xelib.GetFileName(xelib.GetElementFile(override)) === 'Requiem.esp' || xelib.GetFileName(xelib.GetElementFile(override)) === 'Fozars_Dragonborn_-_Requiem_Patch.esp') {
           reqFood = override; 
        }
    })
    const reqCacoFood = xelib.CopyElement(record, reqCACOFile, false);
    updateReferences(xelib.GetReferencedBy(reqCacoFood), type, type === -1, reqCacoFood);
    if (type === -1) {
        xelib.SetValue(reqCacoFood, 'EDID', 'XXX_' + editorID);
        return;
    }
    if (cacoFood) {
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'EDID'), xelib.GetElement(cacoFood, 'EDID'));
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'FULL'), xelib.GetElement(cacoFood, 'FULL'));
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'OBND'), xelib.GetElement(cacoFood, 'OBND'));    
        if (!xelib.GetElement(reqCacoFood, 'KWDA')) {
            xelib.AddElement(reqCacoFood, 'KWDA')
        }
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'KWDA'), xelib.GetElement(cacoFood, 'KWDA')); 
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'Model'), xelib.GetElement(cacoFood, 'Model'));
        if (xelib.GetElement(cacoFood, 'YNAM') && !xelib.GetElement(reqCacoFood, 'YNAM')) {
            xelib.AddElement(reqCacoFood, 'YNAM')
        }
        if (xelib.GetElement(cacoFood, 'YNAM')) {
            xelib.SetElement(xelib.GetElement(reqCacoFood, 'YNAM'), xelib.GetElement(cacoFood, 'YNAM'));
        }
        if (xelib.GetElement(cacoFood, 'ZNAM') && !xelib.GetElement(reqCacoFood, 'ZNAM')) {
            xelib.AddElement(reqCacoFood, 'ZNAM')
        }
        if (xelib.GetElement(cacoFood, 'ZNAM')) {
            xelib.SetElement(xelib.GetElement(reqCacoFood, 'ZNAM'), xelib.GetElement(cacoFood, 'ZNAM'));
        }
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'DATA'), xelib.GetElement(cacoFood, 'DATA')); 
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'ENIT'), xelib.GetElement(cacoFood, 'ENIT'));
        if (type === 3 && xelib.GetFileName(xelib.GetMasterRecord(reqCacoFood)) === xelib.GetFileName(cacoFood)) {
            if (parseInt(level) === 1) {
                xelib.AddLeveledEntry(SublistInnCookedMeal_KRY, xelib.LongName(reqCacoFood), '1', '1');
                xelib.AddLeveledEntry(SublistInnCookedMeal_KRY, xelib.LongName(reqCacoFood), '1', '1');
            } else if (parseInt(level) === 2) {
                xelib.AddLeveledEntry(SublistInnCookedMeal_KRY, xelib.LongName(reqCacoFood), '1', '1');                
            }
            xelib.SetValue(reqCacoFood, 'DATA', '0.7');
        }
    }
    if (reqFood) {
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'EDID'), xelib.GetElement(reqFood, 'EDID'));
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'FULL'), xelib.GetElement(reqFood, 'FULL'));
    }
    xelib.RemoveElement(reqCacoFood, 'Effects');
    xelib.AddElement(reqCacoFood, 'Effects');
    if (cacoFood) {
        let portionEffect;
        let InebriationEffect;
        xelib.GetElements(cacoFood, 'Effects').forEach(effect => {
            if (xelib.GetValue(effect, 'EFID').indexOf('Portion') > -1) {
                portionEffect = xelib.GetLinksTo(effect, 'EFID');
            }
            if (xelib.GetValue(effect, 'EFID').indexOf('Inebriation') > -1) {
                InebriationEffect = xelib.GetLinksTo(effect, 'EFID');
            }
        })
        if (portionEffect) {
            cacoEffectAdd(reqCacoFood, portionEffect, 0, '0');
        }
        if (InebriationEffect) {
            cacoEffectAdd(reqCacoFood, InebriationEffect, 0, '0');
        }
    } else if (editorID === 'REQ_Drink_CinnabarBeer') {
        cacoEffectAdd(reqCacoFood, beerEffect, 0, '0');
    }
    let addedSurival = false;
    let addedEffect = false;
    const isAlchohol = xelib.HasKeyword(reqCacoFood, 'VendorItemDrinkAlcohol [KYWD:01AF101A]');
    for(i = 6;i<textArray.length;i+=2)
    {
        if (textArray[i].trim()) {      
            const magicEffectID = magicArray[i].split('|')[type-1];
            const magicEffectRec = magicEffects[magicEffectID];       
            const value = textArray[i];
            const duration = parseInt(textArray[i+1]);
            if (!addedSurival && !isAlchohol) {
                switch(duration) {
                    case 0:
                        if (level.indexOf('*') > -1) {
                            funcSurvivalAdd(reqCacoFood, Survival_FoodRestoreHungerMedium);
                            cacoEffectAdd(reqCacoFood, FoodBlankEffect, duration, '0');
                        }
                        break;
                    case 360:
                        funcSurvivalAdd(reqCacoFood, Survival_FoodRestoreHungerSmall);
                        cacoEffectAdd(reqCacoFood, FoodBlankEffect, duration, '0');
                        break;
                    case 720:
                        funcSurvivalAdd(reqCacoFood, Survival_FoodRestoreHungerMedium);
                        cacoEffectAdd(reqCacoFood, FoodBlankEffect, duration, '0');
                        break;  
                    case 1080:
                        funcSurvivalAdd(reqCacoFood, Survival_FoodRestoreHungerLarge);
                        cacoEffectAdd(reqCacoFood, KRYGhostveilTEST, duration, '0');
                        if (editorID.toUpperCase().indexOf('HOT') > -1) {
                            cacoEffectAdd(reqCacoFood, Survival_FoodFortifyWarmth, duration, '25');
                            cacoEffectAdd(reqCacoFood, Survival_FoodRestoreCold, 0, '200');
                        }
                        break;                                            
                }
                addedSurival = true;
            }
            cacoEffectAdd(reqCacoFood, magicEffectRec, duration, value);
            addedEffect = true;
        }
    }
    if (!addedEffect) {
        funcSurvivalAdd(reqCacoFood, Survival_FoodRestoreHungerVerySmall);
        cacoEffectAdd(reqCacoFood, FoodBlankEffect, 30, '0');        
    }
    if ((cacoFood && xelib.HasKeyword(cacoFood, 'VendorItemFoodRaw [KYWD:000A0E56]')) || (reqFood && xelib.HasKeyword(reqFood, 'REQ_ContaminatedFood [KYWD:5EAE3726]'))) {
        cacoEffectAdd(reqCacoFood, REQ_Effect_Food_DamageAttributes, 0, '60');  
    }
    xelib.RemoveArrayItem(reqCacoFood, 'Effects', 'EFID', 'NULL - Null Reference [00000000]');
});

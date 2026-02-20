const cacoFile = xelib.FileByName('Complete Alchemy & Cooking Overhaul.esp');
const reqCACOFile = xelib.FileByName('Requiem - CACO.esp');
const reqARFile = xelib.FileByName('Requiem - Alchemy Redone.esp');
const reqDBFile = xelib.FileByName('Fozars_Dragonborn_-_Requiem_Patch.esp');
const reqFile = xelib.FileByName('Requiem.esp');
const updateFile = xelib.FileByName('Update.esm');
const cacoSurvival = xelib.FileByName('CACO_Survival Mode_Patch.esp');
const cacoFishing = xelib.FileByName('CC-Fishing_CACO_Patch.esp');

const Survival_FoodRestoreHungerLarge = xelib.GetElement(updateFile, "01002EE4");
const Survival_FoodRestoreHungerMedium = xelib.GetElement(updateFile, "01002EE3");
const Survival_FoodRestoreHungerSmall = xelib.GetElement(updateFile, "01002EE2");
const Survival_FoodRestoreHungerVerySmall = xelib.GetElement(updateFile, "01002EE1");
const Survival_FoodFortifyWarmth = xelib.GetElement(updateFile, "01002EE6");
const Survival_FoodRestoreCold  = xelib.GetElement(updateFile, "01002EE5");

const REQ_Effect_Food_DamageAttributes = xelib.GetElement(reqFile, "5E04A316");

const FoodBlankEffect = xelib.GetElement(cacoFile, "512F8742");
const KRYGhostveilTEST = xelib.GetElement(cacoFile, "5104C7FA");
const beerEffect = xelib.GetElement(cacoFile, "5144BC98");


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

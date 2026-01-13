const cacoFile = xelib.FileByName('Complete Alchemy & Cooking Overhaul.esp');
const reqCACOFile = xelib.FileByName('Requiem - CACO.esp');
const reqCACOCCFile = xelib.FileByName('Reqiuem - CACO - CC.esp');
const reqARFile = xelib.FileByName('Requiem - Alchemy Redone.esp');
const reqDBFile = xelib.FileByName('Fozars_Dragonborn_-_Requiem_Patch.esp');
const reqFile = xelib.FileByName('Requiem.esp');
const updateFile = xelib.FileByName('Update.esm');

const Survival_FoodRestoreHungerLarge = xelib.GetElement(updateFile, "01002EE4");
const Survival_FoodRestoreHungerMedium = xelib.GetElement(updateFile, "01002EE3");
const Survival_FoodRestoreHungerSmall = xelib.GetElement(updateFile, "01002EE2");
const Survival_FoodRestoreHungerVerySmall = xelib.GetElement(updateFile, "01002EE1");
const Survival_FoodFortifyWarmth = xelib.GetElement(updateFile, "01002EE6");
const Survival_FoodRestoreCold  = xelib.GetElement(updateFile, "01002EE5");

const REQ_Effect_Food_DamageAttributes = xelib.GetElement(reqFile, "5E04A316");

const FoodBlankEffect = xelib.GetElement(cacoFile, "512F8742");
const CACO_FoodWaterEffect = xelib.GetElement(cacoFile, "514E3D17");


let food = {};
let magicEffects = {};

xelib.GetRecords(reqCACOFile, 'ALCH', true).forEach(record => {
    food[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});

xelib.GetRecords(reqCACOCCFile, 'ALCH', true).forEach(record => {
    food[xelib.EditorID(record)] = xelib.GetMasterRecord(record);
});

xelib.GetRecords(reqCACOFile, 'MGEF', true).forEach(record => {
    magicEffects[xelib.EditorID(record)] = record;
})

xelib.GetRecords(reqCACOCCFile, 'MGEF', true).forEach(record => {
    magicEffects[xelib.EditorID(record)] = record;
})

const funcSurvivalAdd = (reqCacoFood, effect) => {
    let newSurvivalEffect = xelib.AddArrayItem(reqCacoFood, 'Effects', 'EFIT\\Magnitude', '0');
    xelib.SetIntValue(newSurvivalEffect, 'EFIT\\Magnitude', 0);
    xelib.SetLinksTo(newSurvivalEffect, 'EFID', effect);
}

const cacoEffectAdd = (reqCacoFood, effect, duration, magnitude) => {
    let newCACOEffect = xelib.AddArrayItem(reqCacoFood, 'Effects', 'EFIT\\Magnitude', magnitude);
    xelib.SetIntValue(newCACOEffect, 'EFIT\\Duration', duration);
    xelib.SetLinksTo(newCACOEffect, 'EFID', effect);
}

let magicArray = [];

fh.loadTextFile('C:\\Users\\schof\\Downloads\\REQ CACO 3 Food - New Stuff (1).csv','').toString().split(/\r?\n/).forEach(line => {
    const textArray = line.split(',');
    const editorID = textArray[0].split(" ")[0].replaceAll('\"','');
    zedit.log(editorID);
    if (editorID === 'name') {
        magicArray = textArray;
        return;
    }
    const record = food[editorID];
    if (!record) {
        return;
    }
    zedit.log(record.toString());    
    const overrides = [record].concat(xelib.GetOverrides(record));
    let cacoFood;
    let reqCacoFood;
    let reqFood;
    overrides.forEach(override => {
        if (xelib.GetFileName(xelib.GetElementFile(override)).indexOf('CACO') > -1 && (xelib.GetFileName(xelib.GetElementFile(override)).indexOf('Requiem') > -1 || xelib.GetFileName(xelib.GetElementFile(override)).indexOf('Reqiuem') > -1)) {
            reqCacoFood = override;        
        } else if (xelib.GetFileName(xelib.GetElementFile(override)) === 'Complete Alchemy & Cooking Overhaul.esp' || (xelib.GetFileName(xelib.GetElementFile(override)).indexOf('CACO') > -1 && xelib.GetFileName(xelib.GetElementFile(override)).indexOf('Requiem') === -1 && xelib.GetFileName(xelib.GetElementFile(override)).indexOf('Reqiuem') === -1)) {
            cacoFood = override;
        } else if (xelib.GetFileName(xelib.GetElementFile(override)) === 'Requiem.esp' || xelib.GetFileName(xelib.GetElementFile(override)) === 'Fozars_Dragonborn_-_Requiem_Patch.esp') {
           reqFood = override; 
        }
    })
    if (reqFood) {
        xelib.SetElement(xelib.GetElement(reqCacoFood, 'EDID'), xelib.GetElement(reqFood, 'EDID'));
    }
    if (cacoFood) {
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
    }
    let addedSurival = false;
    let addedEffect = false;
    const isAlchohol = xelib.HasKeyword(reqCacoFood, 'VendorItemDrinkAlcohol [KYWD:01AF101A]');
    for(i = 7;i<textArray.length;i+=2)
    {
        if (textArray[i].trim()) {
            const magicEffectID = magicArray[i].split(" ")[0].replaceAll('\"','');
            const magicEffectRec = magicEffects[magicEffectID];       
            const value = textArray[i];
            const duration = parseInt(textArray[i+1]);
            if (!addedSurival && !isAlchohol) {
                switch(duration) {
                    case 240:
                        funcSurvivalAdd(reqCacoFood, Survival_FoodRestoreHungerSmall);
                        cacoEffectAdd(reqCacoFood, FoodBlankEffect, duration * 2, '0');
                        break;
                    case 480:
                        funcSurvivalAdd(reqCacoFood, Survival_FoodRestoreHungerMedium);
                        cacoEffectAdd(reqCacoFood, FoodBlankEffect, duration * 2, '0');
                        break;  
                    case 720:
                        funcSurvivalAdd(reqCacoFood, Survival_FoodRestoreHungerLarge);
                        cacoEffectAdd(reqCacoFood, CACO_FoodWaterEffect, duration * 2, '0');
                        break;                                            
                }
                addedSurival = true;
                if (editorID.toUpperCase().indexOf('HOT') > -1) {
                    cacoEffectAdd(reqCacoFood, Survival_FoodFortifyWarmth, duration * 2, '25');
                    cacoEffectAdd(reqCacoFood, Survival_FoodRestoreCold, 0, '200');
                }
            }
            cacoEffectAdd(reqCacoFood, magicEffectRec, duration === 180 ? duration : duration * 2, value);
            addedEffect = true;
        }
    }
    if (!addedEffect) {
        funcSurvivalAdd(reqCacoFood, Survival_FoodRestoreHungerVerySmall);
        cacoEffectAdd(reqCacoFood, FoodBlankEffect, 30, '0');        
    }
    if (cacoFood && xelib.HasKeyword(cacoFood, 'VendorItemFoodRaw [KYWD:000A0E56]')) {
        cacoEffectAdd(reqCacoFood, REQ_Effect_Food_DamageAttributes, 0, '60');  
    }
    xelib.RemoveArrayItem(reqCacoFood, 'Effects', 'EFID', 'NULL - Null Reference [00000000]');
});

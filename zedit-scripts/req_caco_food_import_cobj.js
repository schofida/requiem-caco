const cacoFile = xelib.FileByName('Complete Alchemy & Cooking Overhaul.esp');
const reqCACOFile = xelib.FileByName('Requiem - CACO.esp');
const reqCACOCCFile = xelib.FileByName('Reqiuem - CACO - CC.esp');
const reqARFile = xelib.FileByName('Requiem - Alchemy Redone.esp');
const reqDBFile = xelib.FileByName('Fozars_Dragonborn_-_Requiem_Patch.esp');
const reqFile = xelib.FileByName('Requiem.esp');
const updateFile = xelib.FileByName('Update.esm');
const skyrimFile = xelib.FileByName('Skyrim.esm');

const Survival_FoodRestoreHungerLarge = xelib.GetElement(updateFile, "01002EE4");
const Survival_FoodRestoreHungerMedium = xelib.GetElement(updateFile, "01002EE3");
const Survival_FoodRestoreHungerSmall = xelib.GetElement(updateFile, "01002EE2");
const Survival_FoodRestoreHungerVerySmall = xelib.GetElement(updateFile, "01002EE1");
const Survival_FoodFortifyWarmth = xelib.GetElement(updateFile, "01002EE6");
const Survival_FoodRestoreCold  = xelib.GetElement(updateFile, "01002EE5");

const REQ_Effect_Food_DamageAttributes = xelib.GetElement(reqFile, "5E04A316");
const REQ_DisableRecipe = xelib.GetElement(reqFile, "5EAD3B01");


const CACO_FoodWaterEffect = xelib.GetElement(cacoFile, "512F8742");
const FoodBlankEffect = "514E3D17";

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


xelib.GetRecords(reqCACOCCFile, 'ALCH', true).forEach(record => {
    if (!xelib.GetFlag(record, 'ENIT\\Flags', 'Food Item')) {
        return;
    }
    const removedFood = xelib.EditorID(record).indexOf('XXX') === 0;

    xelib.GetReferencedBy(record).forEach(reference => {
        //if (xelib.GetFileName(xelib.GetElementFile(reference)) !== 'Complete Alchemy & Cooking Overhaul.esp') {
        //    return;
        //}
        const keepGoing = ((xelib.GetFileName(xelib.GetElementFile(reference)).indexOf('CACO') > -1 && xelib.GetFileName(xelib.GetElementFile(reference)).indexOf('CC') > -1)
        || xelib.GetFileName(xelib.GetElementFile(reference)) === 'CACO_Survival Mode_Patch.esp'
        || xelib.GetFileName(xelib.GetElementFile(reference)) === 'CACO Rare Curios Patch.esp'
        || xelib.GetFileName(xelib.GetElementFile(reference)) === 'CACO_Saints&Seducers.esp');
        if (!keepGoing) {
            return;
        }
        if (xelib.Signature(reference) === 'COBJ') {
            zedit.log('Goes Here 1');
            const newRef = xelib.CopyElement(reference, reqCACOCCFile, false);
            zedit.log('Goes Here 2');
            if (removedFood) {
                xelib.SetLinksTo(newRef, 'BNAM', REQ_DisableRecipe);
                return;
            } else if(WorkingHasEffect(record, FoodBlankEffect)) {
                xelib.SetIntValue(newRef, 'NAM1', 2);
            } else if(xelib.GetElements(newRef, 'Items').length === 1 && xelib.HasKeyword(xelib.GetLinksTo(xelib.GetElements(newRef, 'Items')[0], 'CNTO\\Item'), xelib.LongName(rawFood))) {
                xelib.AddItem(newRef, xelib.LongName(salt), '1');
            }
            zedit.log('Goes Here 3');
            if (!xelib.HasElement(newRef, 'Conditions')) {
                return;
            }
            xelib.GetElements(newRef, 'Conditions').forEach(condition => {
                if (xelib.GetValue(condition, 'CTDA\\Function') !== 'GetGlobalValue' || xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Parameter #1')) !== cookingLevel) {
                    return;
                }
                if (xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Comparison Value')) === apprenticeLvl || 
                xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Comparison Value')) === adeptLvl) {
                    xelib.SetValue(condition, 'CTDA\\Type', '10000000');
                    xelib.SetIntValue(condition, 'CTDA\\Comparison Value', 1);
                    xelib.SetValue(condition, 'CTDA\\Function', 'HasPerk');
                    xelib.SetLinksTo(condition, 'CTDA\\Perk', Chef1);                               
                } else if (xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Comparison Value')) === expertLvl || 
                xelib.GetHexFormID(xelib.GetLinksTo(condition, 'CTDA\\Comparison Value')) === masterLvl) {
                    xelib.SetValue(condition, 'CTDA\\Type', '10000000');
                    xelib.SetIntValue(condition, 'CTDA\\Comparison Value', 1);
                    xelib.SetValue(condition, 'CTDA\\Function', 'HasPerk');
                    xelib.SetLinksTo(condition, 'CTDA\\Perk', Chef2); 
                }
            })
            zedit.log('Goes Here 4');
        }
        zedit.log('Goes Here 5');
        if (xelib.Signature(reference) === 'LVLI' && removedFood && xelib.HasLeveledEntry(reference, xelib.LongName(record))) {
            zedit.log('Goes Here 6');
            const newRef = xelib.CopyElement(reference, reqCACOCCFile, false);
            xelib.RemoveLeveledEntry(newRef, xelib.LongName(record))
            zedit.log('Goes Here 7');
        }
    });

});

function WorkingHasEffect(record, edid) {
    return xelib.GetElements(record, 'Effects').some(effect => {
        return xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')) === edid;
    })
}

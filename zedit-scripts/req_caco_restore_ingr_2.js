const reqCACOFile = xelib.FileByName('Requiem - CACO.esp');
const reqCACOCC = xelib.FileByName('Requiem - CACO - CC.esp');
const cacoFile = xelib.FileByName('Complete Alchemy & Cooking Overhaul.esp');
const magicEffects = {
    'IngrRestoreHealth': [xelib.GetElement(reqCACOFile, '0003EB15')],
    'IngrRestoreMagicka': [xelib.GetElement(reqCACOFile, '0003EB17')],
    'IngrRestoreStamina': [xelib.GetElement(reqCACOFile, '0003EB16')],
    'IngrDamageHealth': [xelib.GetElement(reqCACOFile, '0003EB42')],
    'IngrDamageMagicka': [xelib.GetElement(reqCACOFile, '0003A2C6')],
    'IngrDamageStamina': [xelib.GetElement(reqCACOFile, '0003A2B6')]
};

xelib.GetRecords(reqCACOCC, 'LVLI', true).forEach(flst => {
    const editorID = xelib.EditorID(flst);
    const key = Object.keys(magicEffects).find(x => editorID.indexOf(x) > -1);
    if (!key) {
        return;
    }
    xelib.RemoveElement(flst, 'Leveled List Entries');
    xelib.AddElement(flst, 'Leveled List Entries');
    const magicEffect = magicEffects[key];
    const index = parseInt(editorID.replace('CACO_' + key, '')) - 1;
    xelib.GetRecords(reqCACOCC, 'INGR', true).forEach(ingr => {
        if (magicEffect.map(x => {return xelib.LongName(x)}).includes(xelib.GetValue(xelib.GetElements(ingr, 'Effects')[index], 'EFID'))) {
            xelib.AddLeveledEntry(flst, xelib.LongName(ingr), '1', '1');
        }
    });
    xelib.RemovedLeveledEntry(flst, 'NULL - Null Reference [00000000]');
});


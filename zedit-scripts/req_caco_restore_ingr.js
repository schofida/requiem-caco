const reqCACOFile = xelib.FileByName('Requiem - CACO.esp');
const cacoFile = xelib.FileByName('Complete Alchemy & Cooking Overhaul.esp');
const magicEffects = {
    'RestoreIngH': [xelib.GetElement(reqCACOFile, '0003EB15'), xelib.GetElement(cacoFile, '500E4857')],
    'RestoreIngM': [xelib.GetElement(reqCACOFile, '0003EB17')],
    'RestoreIngS': [xelib.GetElement(reqCACOFile, '0003EB16')],
    'DamageIngH': [xelib.GetElement(reqCACOFile, '0003EB42')],
    'DamageIngM': [xelib.GetElement(reqCACOFile, '0003A2C6')],
    'DamageIngS': [xelib.GetElement(reqCACOFile, '0003A2B6')]
};

xelib.GetRecords(reqCACOFile, 'FLST', true).forEach(flst => {
    const editorID = xelib.EditorID(flst);
    const key = Object.keys(magicEffects).find(x => editorID.indexOf(x) > -1);
    if (!key) {
        return;
    }
    xelib.RemoveElement(flst, 'FormIDs');
    xelib.AddElement(flst, 'FormIDs');
    const magicEffect = magicEffects[key];
    const index = parseInt(editorID.replace('CACO_' + key, '')) - 1;
    xelib.GetRecords(reqCACOFile, 'INGR', true).forEach(ingr => {
        if (magicEffect.map(x => {return xelib.LongName(x)}).includes(xelib.GetValue(xelib.GetElements(ingr, 'Effects')[index], 'EFID'))) {
            xelib.AddFormID(flst, xelib.LongName(ingr));
        }
    });
    xelib.RemoveFormID(flst, 'NULL - Null Reference [00000000]');
});


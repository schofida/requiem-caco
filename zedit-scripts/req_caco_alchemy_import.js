const cacoFile = xelib.FileByName('Complete Alchemy & Cooking Overhaul.esp');
const reqCACOFile = xelib.FileByName('Requiem - CACO.esp');
const reqARFile = xelib.FileByName('Requiem - Alchemy Redone.esp');
const reqFile = xelib.FileByName('Requiem.esp');

let ingredients = {};

fh.loadTextFile('C:\\Users\\schof\\Downloads\\REQ CACO 3 Alchemy - Ingredient Values (1).csv','').toString().split(/\r?\n/).forEach(line => {
    const textArray = line.split(',');
    if (textArray[1] === 'I' && textArray[2] === 'V') {
        ingredients[textArray[0].split(" ")[0].replaceAll('\"','')] = {
            value: textArray[12],
            effects: []
        }
    }
});


let effects = {};
let effectID = '';

fh.loadTextFile('C:\\Users\\schof\\Downloads\\REQ CACO 3 Alchemy - Ingredient Strength (2).csv','').toString().split(/\r?\n/).forEach(line => {
    const textArray = line.split(',');
    const editorID = textArray[0].split(" ")[0].replaceAll('\"','');
    if (textArray[1] === 'B' || textArray[1] === 'P') {
        effectID = editorID;
        effects[editorID] = {
            baseCost: textArray[30]
        }
    }
    else if (textArray[1] === 'I' && textArray[27].trim() !== '') {
        if (!ingredients[editorID]) {
            ingredients[editorID] = {
                value: 0,
                effects: []
            }
            ingredients[editorID].effects.push({
                order: textArray[29],
                duration: textArray[28],
                magnitude: textArray[27],
                effectID
            })
        } else {
            ingredients[editorID].effects.push({
                order: textArray[29],
                duration: textArray[28],
                magnitude: textArray[27],
                effectID
            })
        }
    }
});

zedit.log(JSON.stringify(ingredients));

xelib.GetRecords(reqCACOFile, 'MGEF',true).forEach(rec => {
    const record = xelib.GetWinningOverride(rec);
    let effect = effects[xelib.EditorID(record)];
    if (effect) {
        xelib.SetValue(record, 'Magic Effect Data\\DATA\\Base Cost', effect.baseCost);
        effect.record = record;
    }
})

xelib.GetRecords(reqCACOFile, 'INGR',true).forEach(rec => {
    const record = xelib.GetWinningOverride(rec);
    let ingr = ingredients[xelib.EditorID(record)];
    if (ingr) {
        xelib.SetValue(record, 'ENIT\\Ingredient Value', ingr.value);
        xelib.SetFlag(record, 'ENIT\\Flags', 'No auto-calculation', true);
        let cacoIngr = xelib.GetElement(cacoFile, xelib.GetHexFormID(record));
        if (cacoIngr) {
            xelib.SetElement(xelib.GetElement(record, 'DATA'), xelib.GetElement(cacoIngr, 'DATA'));
            if (xelib.GetElement(cacoIngr, 'YNAM') && !xelib.GetElement(record, 'YNAM')) {
                xelib.AddElement(record, 'YNAM');
            }
            if (xelib.GetElement(cacoIngr, 'YNAM')) {
                xelib.SetElement(xelib.GetElement(record, 'YNAM'), xelib.GetElement(cacoIngr, 'YNAM'));
            }
            if (xelib.GetElement(cacoIngr, 'ZNAM') && !xelib.GetElement(record, 'ZNAM')) {
                xelib.AddElement(record, 'ZNAM');
            }
            if (xelib.GetElement(cacoIngr, 'ZNAM')) {
                xelib.SetElement(xelib.GetElement(record, 'ZNAM'), xelib.GetElement(cacoIngr, 'ZNAM'));
            }
            xelib.SetElement(xelib.GetElement(record, 'DATA'), xelib.GetElement(cacoIngr, 'DATA'));
            xelib.SetElement(xelib.GetElement(record, 'Model'), xelib.GetElement(cacoIngr, 'Model'));
            if (xelib.GetElement(cacoIngr, 'KWDA')) {
                xelib.SetElement(xelib.GetElement(record, 'KWDA'), xelib.GetElement(cacoIngr, 'KWDA'));
            }
            xelib.SetElement(xelib.GetElement(record, 'OBND'), xelib.GetElement(cacoIngr, 'OBND'));   
        }
        let ingrEffects = xelib.GetElements(record,'Effects');
        ingr.effects.forEach(ingrEffect => {
            xelib.SetLinksTo(ingrEffects[ingrEffect.order - 1],'EFID',effects[ingrEffect.effectID].record);
            xelib.SetValue(ingrEffects[ingrEffect.order - 1],'EFIT\\Magnitude',ingrEffect.magnitude);
            xelib.SetValue(ingrEffects[ingrEffect.order - 1],'EFIT\\Duration',ingrEffect.duration);
        });
    }
})
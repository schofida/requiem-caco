const breakpoints = ['Skyrim.esm',
                    'Complete Alchemy & Cooking Overhaul.esp',
                    'Requiem.esp',
                    'Requiem - Alchemy Redone.esp'];
let magicEffects = [];
let ingredients = [];
const exceptions = [{
    effect: 'REQ_Alch_FortifyAlteration "Fortify Alteration" [MGEF:0003EB24]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyConjuration "Fortify Conjuration" [MGEF:0003EB25]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyDestruction "Fortify Destruction" [MGEF:0003EB26]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyRestoration "Fortify Restoration" [MGEF:0003EB28]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyEnchanting "Fortify Enchanting" [MGEF:0003EB29]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyIllusion "Fortify Illusion" [MGEF:0003EB27]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyDamage_Marksman "Fortify Marksman" [MGEF:0003EB1B]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyDamage_OneHanded "Fortify One-Handed" [MGEF:0003EB19]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyDamage_TwoHanded "Fortify Two-Handed" [MGEF:0003EB1A]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifySpeech "Fortify Speech" [MGEF:000D6947]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifySneak "Fortify Sneak" [MGEF:0003EB22]',
    file: 'Requiem.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyAlteration "Fortify Alteration" [MGEF:0003EB24]',
    file: 'Requiem - Alchemy Redone.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyConjuration "Fortify Conjuration" [MGEF:0003EB25]',
    file: 'Requiem - Alchemy Redone.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyDestruction "Fortify Destruction" [MGEF:0003EB26]',
    file: 'Requiem - Alchemy Redone.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyRestoration "Fortify Restoration" [MGEF:0003EB28]',
    file: 'Requiem - Alchemy Redone.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyIllusion "Fortify Illusion" [MGEF:0003EB27]',
    file: 'Requiem - Alchemy Redone.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyDamage_Marksman "Fortify Marksman" [MGEF:0003EB1B]',
    file: 'Requiem - Alchemy Redone.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyDamage_OneHanded "Fortify One-Handed" [MGEF:0003EB19]',
    file: 'Requiem - Alchemy Redone.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_FortifyDamage_TwoHanded "Fortify Two-Handed" [MGEF:0003EB1A]',
    file: 'Requiem - Alchemy Redone.esp',
    multiplier: 0.5
}, {
    effect: 'REQ_Alch_Paralysis "Paralysis" [MGEF:00073F30]',
    file: 'Requiem - Alchemy Redone.esp',
    multiplier: 0.25
}]

const getLastBreakpoint = (file => {
  return xelib.GetMasterNames(file).reverse().find(x=> {
    return breakpoints.indexOf(x) > -1;
  })
  
})

xelib.GetLoadedFileNames(true).forEach(fileName => {
    const file = xelib.FileByName(fileName);
    xelib.GetRecords(file, 'MGEF', true).forEach(record => {
        if (xelib.GetHexFormID(record) !== '00090041') {
            return;
        }
        let name = xelib.LongName(record);
        let formID = xelib.GetHexFormID(record);
        let keyword = xelib.HasKeyword(record,'MagicAlchHarmful')  ? 'P' : 'B';
        let flag = xelib.GetFlag(record, 'Magic Effect Data\\DATA\\Flags', 'Power Affects Magnitude') ? 'M' : xelib.GetFlag(record, 'Magic Effect Data\\DATA\\Flags', 'Power Affects Duration') ? 'D' : ' ';
        let magicEffect = magicEffects.find(x => {
            return x.formID === formID && x.flag === flag;
        })
        if (magicEffect) {
            magicEffect.name = name;
            const fileHasBreakPoint = magicEffect.files.some(x => {return x.name === getLastBreakpoint(file)});
            if (breakpoints.indexOf(fileName) > -1 || !fileHasBreakPoint) {
                magicEffect.files.push({
                    name: breakpoints.indexOf(fileName) > -1 ? fileName : getLastBreakpoint(file),
                    baseCost: xelib.GetValue(record, 'Magic Effect Data\\DATA\\Base Cost'),
                });
            } else {
                const prevFile = magicEffect.files.find(x => {
                    return x.name === getLastBreakpoint(file);
                });
                prevFile.baseCost = xelib.GetValue(record, 'Magic Effect Data\\DATA\\Base Cost')
            }  
            return;
        }
        magicEffects.push({
            name,
            formID,
            files: [{
                name: breakpoints.indexOf(fileName) > -1 ? fileName : getLastBreakpoint(file),
                baseCost: xelib.GetValue(record, 'Magic Effect Data\\DATA\\Base Cost')
            }],
            keyword,
            flag
        });  
        return;   
    });
    xelib.GetRecords(file, 'INGR', false).forEach(record => {
        let name = xelib.LongName(record);
        let effectIDs = [];

        let effectIndex = 0;
        let files = [{
            name: breakpoints.indexOf(fileName) > -1 ? fileName : getLastBreakpoint(file),
            effects: xelib.GetElements(record, 'Effects').map(effect => {
                effectIDs.push(xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')));
                effectIndex += 1;
                return {
                    baseEffect: xelib.GetValue(effect, 'EFID'),
                    baseEffectID: xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')),
                    magnitude: xelib.GetValue(effect, 'EFIT\\Magnitude'),
                    duration: xelib.GetValue(effect, 'EFIT\\Duration'),
                    effectIndex
                }
            }),
            value: xelib.GetValue(record, 'DATA\\Value'),
            ingredientValue: xelib.GetValue(record, 'ENIT\\Ingredient Value')
        }];
        xelib.GetOverrides(record).forEach(override => {
            name = xelib.LongName(override);
            const overrideFile = xelib.GetElementFile(override);
            const fileHasBreakPoint = files.some(x => {return x.name === getLastBreakpoint(overrideFile)});
            if (breakpoints.indexOf(xelib.GetFileName(overrideFile)) > -1 || !fileHasBreakPoint) {
                effectIndex = 0;
                files.push({
                    name: breakpoints.indexOf(xelib.GetFileName(overrideFile)) > -1 ? xelib.GetFileName(overrideFile) : getLastBreakpoint(overrideFile),
                    effects: xelib.GetElements(override, 'Effects').map(effect => {
                        effectIDs.push(xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')));
                        effectIndex += 1;
                        return {
                            baseEffect: xelib.GetValue(effect, 'EFID'),
                            baseEffectID: xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')),
                            magnitude: xelib.GetValue(effect, 'EFIT\\Magnitude'),
                            duration: xelib.GetValue(effect, 'EFIT\\Duration'),
                            effectIndex
                        }
                    }),
                    value: xelib.GetValue(override, 'DATA\\Value'),
                    ingredientValue: xelib.GetValue(override, 'ENIT\\Ingredient Value')
                })
            } else {
                const prevFile = files.find(x => {
                    return x.name === getLastBreakpoint(overrideFile);
                });
                effectIndex = 0;
                prevFile.effects = xelib.GetElements(override, 'Effects').map(effect => {
                    effectIDs.push(xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')));
                    effectIndex += 1;
                    return {
                        baseEffect: xelib.GetValue(effect, 'EFID'),
                        baseEffectID: xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')),
                        magnitude: xelib.GetValue(effect, 'EFIT\\Magnitude'),
                        duration: xelib.GetValue(effect, 'EFIT\\Duration'),
                        effectIndex
                    }
                });
                prevFile.value = xelib.GetValue(override, 'DATA\\Value');
                prevFile.ingredientValue = xelib.GetValue(override, 'ENIT\\Ingredient Value');
            }
        })
        ingredients.push({
            name,
            effectIDs,
            files
        })
    });
});

let heading = ['name', 'type', 'flag'];
breakpoints.forEach(file => {
    heading.push(file);
    heading.push('');
});
breakpoints.forEach(file => {
    heading.push(file);
});
breakpoints.forEach(file => {
    heading.push(file);
    heading.push('');
});
breakpoints.forEach(file => {
    heading.push(file);
});
heading.push('Requiem - CACO.esp');
heading.push('');
heading.push('');
heading.push('');
heading.push('');
heading.push('');
zedit.log(heading.join('|'));

let row = 1394;


magicEffects.forEach(magicEffect => {
    let effectLog = [magicEffect.name, magicEffect.keyword, magicEffect.flag];
    let effectStart = row;
    breakpoints.forEach(fileName => {
        const override = magicEffect.files.find(x => {
            return x.name === fileName
        });
        if (override !== undefined) {
            effectLog.push(override.baseCost);
            const multiplier = exceptions.find(x => {
                return x.file === fileName && x.effect === magicEffect.name;
            })
            if (multiplier !== undefined) {
                effectLog.push(multiplier.multiplier);  
            } else if(fileName === 'Complete Alchemy & Cooking Overhaul.esp' && magicEffect.flag === 'D') {
                effectLog.push(0.01);
            } else {
                effectLog.push('');
            }
        } else {
            effectLog.push('');
            effectLog.push('');
        }
    });
    effectLog.push('');
    effectLog.push('');
    effectLog.push('');
    effectLog.push('');
    effectLog.push("=INDEX('Potion Strength'!D:D,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1)");
    effectLog.push("=INDEX('Potion Strength'!E:E,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1)");
    effectLog.push("=INDEX('Potion Strength'!F:F,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1)");
    effectLog.push("=INDEX('Potion Strength'!G:G,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1)");
    effectLog.push("=INDEX('Potion Strength'!H:H,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1)");
    effectLog.push("=INDEX('Potion Strength'!I:I,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1)");
    effectLog.push("=INDEX('Potion Strength'!J:J,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1)");
    effectLog.push("=INDEX('Potion Strength'!K:K,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1)");
    effectLog.push("=vlookup(INDEX('Potion Strength'!$A:$A,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1),'Potion Values'!$A:$G,4,false)")
    effectLog.push("=vlookup(INDEX('Potion Strength'!$A:$A,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1),'Potion Values'!$A:$G,5,false)")
    effectLog.push("=vlookup(INDEX('Potion Strength'!$A:$A,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1),'Potion Values'!$A:$G,6,false)")
    effectLog.push("=vlookup(INDEX('Potion Strength'!$A:$A,MATCH($A" + effectStart + ", 'Potion Strength'!$A:$A, 0)+if(Multipliers!$H$2=100,5,if(Multipliers!$H$2>=75,4,if(Multipliers!$H$2>=50,3,if(Multipliers!$H$2>=25,2,1)))),1),'Potion Values'!$A:$G,7,false)")
    effectLog.push(1);
    effectLog.push(1);
    effectLog.push("");
    effectLog.push("=IF(F" + effectStart + "<>\"\",F" + effectStart + ",IF(J" + effectStart + "<>\"\",J" + effectStart + ",IF(H" + effectStart + "<>\"\",H" + effectStart + ",1)))*AC" + effectStart + "");
    effectLog.push("=IF(G" + effectStart + "<>\"\",G" + effectStart + ",IF(K" + effectStart + "<>\"\",K" + effectStart + ",IF(I" + effectStart + "<>\"\",I" + effectStart + ",\"\")))");

    row += 1;

    iRows = [];
    
    ingredients.filter(x => {
        return x.effectIDs.indexOf(magicEffect.formID) > -1;
    }).forEach(ingredient => {
        let iLog = [ingredient.name, 'I'];
        iLog.push("=IF(ISNA(VLOOKUP(A"+row+",'Ingredient Rarity'!B:C,2,FALSE)),if(OR(REGEXMATCH(A"+row+",\"Extract\"),REGEXMATCH(A"+row+",\"CACO_Blood\")),Multipliers!$J$2,if(REGEXMATCH(A"+row+",\"REQ_\"),Multipliers!$J$3,Multipliers!$J$4)),VLOOKUP(A"+row+",'Ingredient Rarity'!B:C,2,FALSE))")
        breakpoints.forEach(fileName => {
            const override = ingredient.files.find(x => {
                return x.name === fileName
            });
            let effect = undefined;
            if (override !== undefined) {
                effect = override.effects.find(x => {
                    return x.baseEffectID === magicEffect.formID
                });
            }
            if (effect !== undefined) {
                iLog.push(effect.magnitude);
                iLog.push(effect.duration);
            } else {
                iLog.push('');
                iLog.push('');
            }
        });
        breakpoints.forEach(fileName => {
            const override = ingredient.files.find(x => {
                return x.name === fileName
            });
            let effect = undefined;
            if (override !== undefined) {
                effect = override.effects.find(x => {
                    return x.baseEffectID === magicEffect.formID
                });
            }
            if (effect !== undefined) {
                iLog.push(effect.effectIndex);
            } else {
                iLog.push('');
            }
        });
        iLog.push('=IF(OR(D'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="M",Multipliers!$D$2*D'+row+'*if(OR($E$'+effectStart+'="",$C$'+effectStart+'<>"M"),1,$E$'+effectStart+')*(Multipliers!$D$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=80,2,if(Multipliers!$H$2>=60,1.8,if(Multipliers!$H$2>=40,1.6,if(Multipliers!$H$2>=20,1.4,if(Multipliers!$H$2>=10,1.2,1)))))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1)*if(AND(Multipliers!$H$2>=20,REGEXMATCH($A$'+effectStart+',"Restore")),1.25,1),D'+row+'))');
        iLog.push('=IF(OR(E'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="D",Multipliers!$D$2*E'+row+'*if(OR($E$'+effectStart+'="",$C$'+effectStart+'<>"D"),1,$E$'+effectStart+')*(Multipliers!$D$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=80,2,if(Multipliers!$H$2>=60,1.8,if(Multipliers!$H$2>=40,1.6,if(Multipliers!$H$2>=20,1.4,if(Multipliers!$H$2>=10,1.2,1)))))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1)*if(AND(Multipliers!$H$2>=20,REGEXMATCH($A$'+effectStart+',"Restore")),1.25,1),E'+row+'))');
        iLog.push('=IF(OR(F'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="M",Multipliers!$E$2*F'+row+'*if(OR($G$'+effectStart+'="",$C$'+effectStart+'<>"M"),1,$G$'+effectStart+')*(Multipliers!$E$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=80,1.75,if(Multipliers!$H$2>=40,1.45,if(Multipliers!$H$2>=10,1.25,1)))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1),F'+row+'))');
        iLog.push('=IF(OR(G'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="D",Multipliers!$E$2*G'+row+'*if(OR($G$'+effectStart+'="",$C$'+effectStart+'<>"D"),1,$G$'+effectStart+')*(Multipliers!$E$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=80,1.75,if(Multipliers!$H$2>=40,1.45,if(Multipliers!$H$2>=10,1.25,1)))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1),G'+row+'))');
        iLog.push('=IF(OR(H'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="M",Multipliers!$F$2*H'+row+'*if(OR($I$'+effectStart+'="",$C$'+effectStart+'<>"M"),1,$I$'+effectStart+')*(Multipliers!$F$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=20,1.5,if(Multipliers!$H$2>=10,1.25,1))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1)*if(AND(Multipliers!$H$2>=25,REGEXMATCH($A$'+effectStart+',"Restore")),1.25,1)*if(Multipliers!$H$2>=100,1.2,1)*if(AND(Multipliers!$H$2>=100,$B$'+effectStart+'="P"),1.5,1)*if(AND(Multipliers!$H$2>=100,$B$'+effectStart+'="B"),1.5,1)*if(AND(Multipliers!$H$2>=100,REGEXMATCH($A$'+effectStart+',"Restore")),1.5,1),H'+row+'))');
        iLog.push('=IF(OR(I'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="D",Multipliers!$F$2*I'+row+'*if(OR($I$'+effectStart+'="",$C$'+effectStart+'<>"D"),1,$I$'+effectStart+')*(Multipliers!$F$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=20,1.5,if(Multipliers!$H$2>=10,1.25,1))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1)*if(AND(Multipliers!$H$2>=25,REGEXMATCH($A$'+effectStart+',"Restore")),1.25,1)*if(Multipliers!$H$2>=100,1.2,1)*if(AND(Multipliers!$H$2>=100,$B$'+effectStart+'="P"),1.5,1)*if(AND(Multipliers!$H$2>=100,$B$'+effectStart+'="B"),1.5,1)*if(AND(Multipliers!$H$2>=100,REGEXMATCH($A$'+effectStart+',"Restore")),1.5,1),I'+row+'))');
        iLog.push('=IF(OR(J'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="M",Multipliers!$G$2*J'+row+'*if(OR($K$'+effectStart+'="",$C$'+effectStart+'<>"M"),1,$K$'+effectStart+')*(Multipliers!$G$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=20,1.5,if(Multipliers!$H$2>=10,1.25,1))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1)*if(Multipliers!$H$2>=100,1.2,1)*0.5,J'+row+'))');
        iLog.push('=IF(OR(K'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="D",Multipliers!$G$2*K'+row+'*if(OR($K$'+effectStart+'="",$C$'+effectStart+'<>"D"),1,$K$'+effectStart+')*(Multipliers!$G$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=20,1.5,if(Multipliers!$H$2>=10,1.25,1))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1)*if(Multipliers!$H$2>=100,1.2,1)*0.5,K'+row+'))');
        iLog.push('=if(OR(TRIM(CONCAT(P'+row+',Q'+row+'))="",B'+row+'<>"I"),"",floor($D$'+effectStart+'*if(P'+row+'=0,1,max(P'+row+'^1.1,1))*if(Q'+row+'=0,1,(Q'+row+'/10)^1.1)))')
        iLog.push('=if(OR(TRIM(CONCAT(R'+row+',S'+row+'))="",B'+row+'<>"I"),"",floor($F$'+effectStart+'*if(R'+row+'=0,1,max(R'+row+'^1.1,1))*if(S'+row+'=0,1,(S'+row+'/10)^1.1)))')
        iLog.push('=if(OR(TRIM(CONCAT(T'+row+',U'+row+'))="",B'+row+'<>"I"),"",floor($H$'+effectStart+'*if(T'+row+'=0,1,max(T'+row+'^1.1,1))*if(U'+row+'=0,1,(U'+row+'/10)^1.1)))')
        iLog.push('=if(OR(TRIM(CONCAT(V'+row+',W'+row+'))="",B'+row+'<>"I"),"",floor($J$'+effectStart+'*if(V'+row+'=0,1,max(V'+row+'^1.1,1))*if(W'+row+'=0,1,(W'+row+'/10)^1.1)))')
        iLog.push('=if($B'+row+'<>"I","",if(F'+row+'<>"",F'+row+'*if($C$'+effectStart+'="M",$C'+row+'*$AB$'+effectStart+',1),if(AND(REGEXMATCH($A'+row+',"REQ_"),J'+row+'<>""),J'+row+'*if($C$'+effectStart+'="M",$C'+row+'*$AB$'+effectStart+',1),if(AND(REGEXMATCH($A'+row+',"REQ_"),H'+row+'<>""),H'+row+'*if($C$'+effectStart+'="M",$C'+row+'*$AB$'+effectStart+',1),""))))');
        iLog.push('=if($B'+row+'<>"I","",if(G'+row+'<>"",G'+row+'*if($C$'+effectStart+'="D",$C'+row+'*$AB$'+effectStart+',1),if(AND(REGEXMATCH($A'+row+',"REQ_"),K'+row+'<>""),K'+row+'*if($C$'+effectStart+'="D",$C'+row+'*$AB$'+effectStart+',1),if(AND(REGEXMATCH($A'+row+',"REQ_"),I'+row+'<>""),I'+row+'*if($C$'+effectStart+'="M",$C'+row+'*$AB$'+effectStart+',1),""))))');
        iLog.push('=if($B'+row+'<>"I","",if(M'+row+'<>"",M'+row+',if(AND(REGEXMATCH($A'+row+',"REQ_"),O'+row+'<>""),O'+row+',if(AND(REGEXMATCH($A'+row+',"REQ_"),N'+row+'<>""),N'+row+',""))))');
        iLog.push('=IF(OR(AB'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="M",Multipliers!$I$2*AB'+row+'*if(OR($AF$'+effectStart+'="",$C$'+effectStart+'<>"M"),1,$AF$'+effectStart+')*(Multipliers!$I$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=20,1.5,if(Multipliers!$H$2>=10,1.25,1))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1)*if(AND(Multipliers!$H$2>=25,REGEXMATCH($A$'+effectStart+',"Restore")),1.25,1),AB'+row+'))');
        iLog.push('=IF(OR(AC'+row+'="",NOT($B'+row+'="I")),"",if($C$'+effectStart+'="D",Multipliers!$I$2*AC'+row+'*if(OR($AF$'+effectStart+'="",$C$'+effectStart+'<>"D"),1,$AF$'+effectStart+')*(Multipliers!$I$3*(Multipliers!$H$2/100))*if(Multipliers!$H$2>=20,1.5,if(Multipliers!$H$2>=10,1.25,1))*if(AND(Multipliers!$H$2>=50,$B$'+effectStart+'="P"),1.25,1)*if(AND(Multipliers!$H$2>=25,$B$'+effectStart+'="B"),1.25,1)*if(AND(Multipliers!$H$2>=25,REGEXMATCH($A$'+effectStart+',"Restore")),1.25,1),AC'+row+'))');
        iLog.push('');
        iLog.push('=if(OR(TRIM(CONCAT($AE'+row+',$AF'+row+'))="",$B'+row+'<>"I"),"",floor($AE$'+effectStart+'*if($AE'+row+'=0,1,max($AE'+row+'^1.1,1))*if($AF'+row+'=0,1,($AF'+row+'/10)^1.1)))')
        iRows.push(iLog.join('|'));
        row += 1;
    });
    if (iRows.length > 0) {
        effectLog.push("=COUNTA($AH"+(effectStart+1)+":$AH"+(effectStart+iRows.length)+")");
    } else {
        effectLog.push(0);        
    }
    zedit.log(effectLog.join('|'));
    iRows.forEach(x => {
        zedit.log(x);
    });
});

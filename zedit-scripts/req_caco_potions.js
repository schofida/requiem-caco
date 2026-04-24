const breakpoints = ['Skyrim.esm',
                    'Complete Alchemy & Cooking Overhaul.esp',
                    'Requiem.esp',
                    'Requiem - Alchemy Redone.esp'];
let magicEffects = [];
let potions = [];

const getLastBreakpoint = (file => {
  return xelib.GetMasterNames(file).reverse().find(x=> {
    return breakpoints.indexOf(x) > -1;
  })
  
})

xelib.GetLoadedFileNames(true).forEach(fileName => {
    const file = xelib.FileByName(fileName);
    xelib.GetRecords(file, 'MGEF', false).forEach(record => {
        if (!xelib.HasKeyword(record,'MagicAlchBeneficial') && !xelib.HasKeyword(record,'MagicAlchHarmful')) {
            return;
        }
        if (!xelib.IsMaster(record)) {
            return;
        }
        let name = xelib.LongName(record);
        let formID = xelib.GetHexFormID(record);
        let flag = xelib.GetFlag(record, 'Magic Effect Data\\DATA\\Flags', 'Power Affects Magnitude') ? 'M' : xelib.GetFlag(record, 'Magic Effect Data\\DATA\\Flags', 'Power Affects Duration') ? 'D' : ' ';
        let files = [{
            name: breakpoints.indexOf(fileName) > -1 ? fileName : getLastBreakpoint(file),
            baseCost: xelib.GetValue(record, 'Magic Effect Data\\DATA\\Base Cost')
        }];
        xelib.GetOverrides(record).forEach(override => {
            name = xelib.LongName(override);
            flag = xelib.GetFlag(override, 'Magic Effect Data\\DATA\\Flags', 'Power Affects Magnitude') ? 'M' : xelib.GetFlag(override, 'Magic Effect Data\\DATA\\Flags', 'Power Affects Duration') ? 'D' : ' ';
            const overrideFile = xelib.GetElementFile(override);
            const fileHasBreakPoint = files.some(x => {return x.name === getLastBreakpoint(overrideFile)});
            if (breakpoints.indexOf(xelib.GetFileName(overrideFile)) > -1 || !fileHasBreakPoint) {
                files.push({
                    name: breakpoints.indexOf(xelib.GetFileName(overrideFile)) > -1 ? xelib.GetFileName(overrideFile) : getLastBreakpoint(overrideFile),
                    baseCost: xelib.GetValue(override, 'Magic Effect Data\\DATA\\Base Cost')
                });
            } else {
                const prevFile = files.find(x => {
                    return x.name = getLastBreakpoint(overrideFile);
                });
                prevFile.baseCost = xelib.GetValue(override, 'Magic Effect Data\\DATA\\Base Cost')
            }
        })
        magicEffects.push({
            name,
            formID,
            files,
            flag
        })
    });
    xelib.GetRecords(file, 'ALCH', false).forEach(record => {
        if (!xelib.HasKeyword(record,'VendorItemPotion') && !xelib.HasKeyword(record,'VendorItemPoison')) {
            return;
        }
        if (!xelib.IsMaster(record)) {
            return;
        }
        let name = xelib.LongName(record);
        let effectIDs = [];
        let files = [{
            name: breakpoints.indexOf(fileName) > -1 ? fileName : getLastBreakpoint(file),
            effects: xelib.GetElements(record, 'Effects').map(effect => {
                effectIDs.push(xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')));
                return {
                    baseEffect: xelib.GetValue(effect, 'EFID'),
                    baseEffectID: xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')),
                    magnitude: xelib.GetValue(effect, 'EFIT\\Magnitude'),
                    duration: xelib.GetValue(effect, 'EFIT\\Duration')
                }
            }),
            value: xelib.GetValue(record, 'ENIT\\Value')
        }];
        xelib.GetOverrides(record).forEach(override => {
            name = xelib.LongName(override);
            const overrideFile = xelib.GetElementFile(override);
            const fileHasBreakPoint = files.some(x => {return x.name === getLastBreakpoint(overrideFile)});
            if (breakpoints.indexOf(xelib.GetFileName(overrideFile)) > -1 || !fileHasBreakPoint) {
                files.push({
                    name: breakpoints.indexOf(xelib.GetFileName(overrideFile)) > -1 ? xelib.GetFileName(overrideFile) : getLastBreakpoint(overrideFile),
                    effects: xelib.GetElements(override, 'Effects').map(effect => {
                        effectIDs.push(xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')));
                        return {
                            baseEffect: xelib.GetValue(effect, 'EFID'),
                            baseEffectID: xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')),
                            magnitude: xelib.GetValue(effect, 'EFIT\\Magnitude'),
                            duration: xelib.GetValue(effect, 'EFIT\\Duration')
                        }
                    }),
                    value: xelib.GetValue(override, 'ENIT\\Value')
                })
            } else {
                const prevFile = files.find(x => {
                    return x.name = getLastBreakpoint(overrideFile);
                });
                prevFile.effects = xelib.GetElements(override, 'Effects').map(effect => {
                    effectIDs.push(xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')));
                    return {
                        baseEffect: xelib.GetValue(effect, 'EFID'),
                        baseEffectID: xelib.GetHexFormID(xelib.GetLinksTo(effect, 'EFID')),
                        magnitude: xelib.GetValue(effect, 'EFIT\\Magnitude'),
                        duration: xelib.GetValue(effect, 'EFIT\\Duration')
                    }
                });
                prevFile.value = xelib.GetValue(override, 'ENIT\\Value');
            }
        })
        potions.push({
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
zedit.info(heading.join(','));

magicEffects.forEach(magicEffect => {
    let log = [magicEffect.name, 'M', magicEffect.flag];
    breakpoints.forEach(fileName => {
        const override = magicEffect.files.find(x => {
            return x.name === fileName
        });
        if (override !== undefined) {
            log.push(override.baseCost);
            log.push('');   
        } else {
            log.push('');
            log.push('');
        }
    });
    zedit.info(log.join(','));
    potions.filter(x => {
        return x.effectIDs.indexOf(magicEffect.formID) > -1;
    }).forEach(potion => {
        let iLog = [potion.name, 'I', ''];
        breakpoints.forEach(fileName => {
            const override = potion.files.find(x => {
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
        zedit.info(iLog.join(','));
    });
});

zedit.info(['name', 'type', 'flag'].concat(breakpoints).join(','));

potions.forEach(potion => {
    let log = [potion.name, 'I', 'V'];
    breakpoints.forEach(fileName => {
        const override = potion.files.find(x => {
            return x.name === fileName
        });
        if (override !== undefined) {
            log.push(override.value); 
        } else {
            log.push('');
        }
    });
    zedit.info(log.join(','));
});


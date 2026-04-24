const breakpoints = ['Skyrim.esm',
                    'Complete Alchemy & Cooking Overhaul.esp',
                    'Requiem.esp'];
let magicEffects = [];
let food = [];

xelib.BuildReferences(0,true);

const getLastBreakpoint = (file => {
  return xelib.GetMasterNames(file).reverse().find(x=> {
    return breakpoints.indexOf(x) > -1;
  })
  
})

xelib.GetLoadedFileNames(true).forEach(fileName => {
    const file = xelib.FileByName(fileName);
    xelib.GetRecords(file, 'MGEF', true).forEach(record => {
        if (xelib.LongName(record).toUpperCase().indexOf('FOOD') === -1) {
            return;
        }
        let name = xelib.LongName(record);
        let formID = xelib.GetHexFormID(record);
        let flag = ' ';
        let magicEffect = magicEffects.find(x => {
            return x.formID === formID && x.flag === flag;
        })
        if (magicEffect) {
            magicEffect.name = name;
            const fileHasBreakPoint = magicEffect.files.some(x => {return x.name === getLastBreakpoint(file)});
            if (breakpoints.indexOf(fileName) > -1 || !fileHasBreakPoint) {
                magicEffect.files.push({
                    name: breakpoints.indexOf(fileName) > -1 ? fileName : getLastBreakpoint(file)
                });
            } else {
                const prevFile = magicEffect.files.find(x => {
                    return x.name === getLastBreakpoint(file);
                });
            }  
            return;
        }
        magicEffects.push({
            name,
            formID,
            files: [{
                name: breakpoints.indexOf(fileName) > -1 ? fileName : getLastBreakpoint(file)
            }],
            flag
        });  
        return;   
    });
    xelib.GetRecords(file, 'ALCH', false).forEach(record => {
        let name = xelib.LongName(record);
        if (!xelib.HasKeyword(record,'VendorItemFood') && !xelib.HasKeyword(record,'VendorItemFoodRaw') && !xelib.GetFlag(record, 'ENIT\\Flags', 'Food Item')) {
            return;
        }
        if (!xelib.IsMaster(record)) {
            return;
        }
        let recipes = [];

        xelib.GetReferencedBy(record).forEach(ref => {
            if (xelib.Signature(ref) !== 'COBJ') {
                return;
            }
            if (xelib.GetFileName(xelib.GetElementFile(ref)) !== 'Complete Alchemy & Cooking Overhaul.esp') {
                return;
            }
            if (xelib.GetHexFormID(xelib.GetLinksTo(ref, 'CNAM')) !== xelib.GetHexFormID(record)) {
                return;
            }
            let recipe = [];
            let recipeValue = 0;
            xelib.GetElements(ref, 'Items').forEach(item => {
                recipe.push({
                    name: xelib.GetValue(item, 'CNTO\\Item'),
                    count: xelib.GetIntValue(item, 'CNTO\\Count')
                })
                const itemRef = xelib.GetWinningOverride(xelib.GetLinksTo(item, 'CNTO\\Item'));
                if (itemRef > 0 && xelib.Signature(itemRef) === 'INGR') {
                    recipeValue += xelib.GetIntValue(itemRef,'ENIT\\Ingredient Value') * xelib.GetIntValue(item, 'CNTO\\Count');
                } else if (itemRef > 0 && xelib.Signature(itemRef) === 'ALCH') {
                    recipeValue += xelib.GetIntValue(itemRef,'ENIT\\Value') * xelib.GetIntValue(item, 'CNTO\\Count');
                } else if (itemRef > 0 && xelib.Signature(itemRef) === 'MISC') {
                    recipeValue += xelib.GetIntValue(itemRef,'DATA\\Value') * xelib.GetIntValue(item, 'CNTO\\Count');
                }
            })
            recipes.push({
                recipe,
                recipeValue
            })
        })
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
            value: xelib.GetValue(record, 'ENIT\\Value')
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
                    value: xelib.GetValue(override, 'ENIT\\Value')
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
                prevFile.value = xelib.GetValue(override, 'ENIT\\Value');
            }
        })
        food.push({
            name,
            effectIDs,
            files,
            recipes
        })
    });
});

let heading2 = ['name', 'type'];
breakpoints.forEach(file => {
    heading2.push(file);
    heading2.push('');
});
breakpoints.forEach(file => {
    heading2.push(file);
});
zedit.log(heading2.join('|'));


magicEffects.forEach(magicEffect => {
    let effectLog = [magicEffect.name, 'M'];
    breakpoints.forEach(fileName => {
        const override = magicEffect.files.find(x => {
            return x.name === fileName
        });
    });

    iRows = [];
    
    food.filter(x => {
        return x.effectIDs.indexOf(magicEffect.formID) > -1;
    }).forEach(foodItem => {
        let iLog = [foodItem.name, 'A'];
        breakpoints.forEach(fileName => {
            const override = foodItem.files.find(x => {
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
            const override = foodItem.files.find(x => {
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
        iRows.push(iLog.join('|'));
    });
    zedit.log(effectLog.join('|'));
    iRows.forEach(x => {
        zedit.log(x);
    });
});


let heading3 = ['name'];
breakpoints.forEach(file => {
    heading3.push(file);
});
magicEffects.forEach(effect => {
    heading3.push(effect.name);
    heading3.push('');
});
zedit.log(heading3.join('|'));

food.forEach(foodItem => {
    let iLog = [];
    iLog.push(foodItem.name);
    breakpoints.forEach(fileName => {
        const override = foodItem.files.find(x => {
            return x.name === fileName
        });
        if (override !== undefined) {
            iLog.push(override.value);
        } else {
            iLog.push('');
        }
    });
    zedit.log(iLog.join('|'));
});

let heading4 = ['name','value'];
breakpoints.forEach(file => {
    heading4.push(file);
});
food.forEach(foodItem => {
    foodItem.recipes.forEach(recipes => {
        let iLog = [];
        iLog.push(foodItem.name);
        iLog.push(recipes.recipeValue);
        recipes.recipe.forEach(recipe => {
            iLog.push(recipe.name);
            iLog.push(recipe.count);
        });
        zedit.log(iLog.join('|'));
    });
});
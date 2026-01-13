let weap;
let helmet;
let armor;
let gauntlets;
let boots;
let shield;

zedit.GetSelectedRecords('LVLN').forEach(record => {
  xelib.GetElements(record, 'Leveled List Entries').forEach(entry => {
    const ref = xelib.GetLinksTo(entry, 'LVLO\\Reference');
    
    ResetValues();

    if (xelib.HasElement(ref, 'Items')) {
      xelib.GetElements(ref, 'Items').forEach(GetValueFromItem);
    }
    if (xelib.HasElement(ref, 'DOFT')) {
      xelib.GetElements(xelib.GetLinksTo(ref, 'DOFT'), 'INAM').forEach(GetValueFromOutfit);
    }
    const values = [
      GetRecordName(ref),
      xelib.GetValue(entry, 'LVLO\\Level'),
      xelib.FullName(xelib.GetLinksTo(ref, 'RNAM')),
      GetRecordName(xelib.GetLinksTo(ref, 'TPLT')),
      weap.length > 0 ? weap[0] : '',
      weap.length > 1 ? weap[1] : '',
      weap.length > 2 ? weap[2] : '',
      helmet,
      armor,
      gauntlets,
      boots,
      shield
    ]
    zedit.log(values.join(';'));
  });
});

function ResetValues() {
  weap = [];
  helmet = '';
  armor = '';
  gauntlets = '';
  boots = '';
  shield = '';
}

function GetValueFromItem(item) {
   GetValues(xelib.GetLinksTo(item, 'CNTO\\Item'), false);
}

function GetValueFromLeveledListEntry(entry, isOutfit) {
  GetValues(xelib.GetLinksTo(entry, 'LVLO\\Reference'), isOutfit);
}

function GetValueFromOutfit(entry) {
  GetValues(xelib.GetLinksTo(entry, ''), true);
}

function GetRecordName(record) {
  if (!record) {
    return '';
  }
  if (xelib.FullName(record)) {
    return xelib.FullName(record);
  }
  if (xelib.HasElement(record, 'TPLT')) {
    return GetRecordName(xelib.GetLinksTo(record, 'TPLT'));
  }
  return '';
}

function GetValues(element, isOutfit) {
  if (xelib.Signature(element) === 'LVLI') {
    if (xelib.HasElement(element, 'Leveled List Entries')) {
      if (xelib.GetFlag(element, "LVLF", "Calculate for each item in count") && isOutfit) {
        armor = xelib.EditorID(element);
      } else if (xelib.GetFlag(element, "LVLF", "Calculate for each item in count")) {
        weap.push(xelib.EditorID(element));
      } else {
        xelib.GetElements(element, 'Leveled List Entries').forEach(li => {
          GetValueFromLeveledListEntry(li, isOutfit);
        });
      }
    }
  } else if (xelib.Signature(element) === 'WEAP') {
    weap.push(xelib.FullName(element));
  } else if (xelib.Signature(element) === 'ARMO') {
    if (xelib.HasKeyword(element, 'ArmorBoots') || xelib.HasKeyword(element, 'ClothingFeet')) {
      boots = xelib.FullName(element);
    }
    if (xelib.HasKeyword(element, 'ArmorHelmet')) {
      helmet = xelib.FullName(element);
    }
    if (xelib.HasKeyword(element, 'ArmorGauntlets')) {
      gauntlets = xelib.FullName(element);
    }
    if (xelib.HasKeyword(element, 'ArmorCuirass') || xelib.HasKeyword(element, 'ClothingBody')) {
      armor = xelib.FullName(element);
    }
    if (xelib.HasKeyword(element, 'ArmorShield')) {
      shield = xelib.FullName(element);
    }
  }
}
const reqCACOFile = xelib.FileByName('Requiem - CACO.esp');

zedit.GetSelectedRecords().forEach(record => {
    let newEl = xelib.CopyElement(record, reqCACOFile, false);
    let reqEl = xelib.GetPreviousOverride(newEl, reqCACOFile);
    xelib.SetElement(xelib.GetElement(newEl, 'EDID'), xelib.GetElement(reqEl, 'EDID'));
    xelib.SetElement(xelib.GetElement(newEl, 'DNAM'), xelib.GetElement(reqEl, 'DNAM'));
});
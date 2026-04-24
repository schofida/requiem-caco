xelib.BuildReferences(0, true);
const cwomcm = xelib.GetRecord(xelib.FileByName("Civil War Overhaul.esp"), 184752870);
const cwoMCMScript = xelib.GetScript(cwomcm, 'CWOMCMScript');
let i = 0;
zedit.GetSelectedRecords().forEach(record => {
    i = i + 1;
    //const logStr = "SiegeFixWindhelmRespawnAttacker5Marker" + i + ".SetPosition(" + xelib.GetValue(record, 'DATA\\Position\\X') + 
        ", " + xelib.GetValue(record, 'DATA\\Position\\Y') + ", " + xelib.GetValue(record, 'DATA\\Position\\Z') + ")";
    //zedit.log(logStr);   
    
    const prop1 = xelib.AddScriptProperty(cwoMCMScript, xelib.EditorID(record), "Object", "Edited");
    xelib.AddElementValue(prop1, "Value\\Object Union\\Object v2\\FormID", xelib.GetHexFormID(record));
      xelib.AddElementValue(prop1, "Value\\Object Union\\Object v2\\Alias", "None");
})
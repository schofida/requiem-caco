xelib.GetREFRs(xelib.FileByName('Skyrim.esm'), 'ACTI').forEach(record => {
  if (!xelib.HasElement(record, 'VMAD')) {
    return;
  }
  if(!xelib.HasScript(record, 'defaultsetStageTrigSCRIPT')) {
	return;
  }
  if(!xelib.GetValue(xelib.GetScriptProperty(xelib.GetScript(record, 'defaultsetStageTrigSCRIPT'), 'myQuest'), 'Value\\Object Union\\Object v2\\FormID').includes('CWSiege')) {
    return;
  }
  
      zedit.log(xelib.GetHexFormID(record) + ' ' + 
               xelib.GetValue(xelib.GetScriptProperty(xelib.GetScript(record, 'defaultsetStageTrigSCRIPT'), 'stage'), 'Int32') + ' ' +
               (xelib.HasElement(record, 'XLRT') ? xelib.GetValue(record, 'XLRT\\[0]') : '???') + ' ' +
              xelib.GetValue(record, 'Cell')  
               );   
});

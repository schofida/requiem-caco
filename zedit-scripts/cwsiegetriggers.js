xelib.GetRecords(xelib.FileByName('Skyrim.esm'), 'LCRT').forEach(record => {
    if (xelib.EditorID(record).includes('CWSiegeAttackTrigger') || xelib.EditorID(record).includes('CWSiegeDefendTrigger')) {
        xelib.GetReferencedBy(record).forEach(reference => {
            if (xelib.Signature(reference) === 'REFR') {
                let line = xelib.GetHexFormID(reference) + '|' + xelib.EditorID(record) + '|';
                if (xelib.HasElement(reference, 'VMAD') && xelib.HasScript(reference, 'defaultsetStageTrigSCRIPT')) {
                    line += xelib.GetValue(xelib.GetScriptProperty(xelib.GetScript(reference, 'defaultsetStageTrigSCRIPT'), 'myQuest'), 'Value\\Object Union\\[Object v1|Object v2]\\FormID') + '|'
                    line += xelib.GetValue(xelib.GetScriptProperty(xelib.GetScript(reference, 'defaultsetStageTrigSCRIPT'), 'stage'), 'Int32') + '|'
                } 
                else { 
                    line += 'Not Triggering Quest??|'
                    line += '0|'
                }
                line += xelib.GetValue(reference, 'Cell');
                zedit.log(line);
            }
        })
    }
});
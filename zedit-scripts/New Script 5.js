zedit.GetSelectedRecords().forEach(record => {
	xelib.GetElements(record, 'Leveled List Entries').forEach(entry => {
      zedit.log(xelib.GetValue(entry,'LVLO\\Reference') + ';' + xelib.GetValue(entry,'LVLO\\Level'));
    });
});
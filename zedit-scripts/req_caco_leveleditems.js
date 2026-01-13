zedit.GetSelectedRecords().forEach(record => {
    xelib.GetElements(record, 'Leveled List Entries').forEach(x => {
        zedit.log(    xelib.LongName(record) + "," + xelib.GetValue(x,'LVLO\\Reference'));
    });
});
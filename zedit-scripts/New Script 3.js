zedit.GetSelectedRecords().forEach(record => {
    xelib.GetElements(record, 'Leveled List Entries').forEach(li => {
      xelib.SetValue(li, 'LVLO\\Level', '1');
    });
})
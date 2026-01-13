zedit.GetSelectedRecords('ALCH').forEach(x => {
  xelib.SetValue(x, 'EDID', 'XXX_' + xelib.GetValue(x, 'EDID'));
});
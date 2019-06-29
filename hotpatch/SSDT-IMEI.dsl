// Deals with mixed systems (HD4000 on 6-series, HD3000 on 7-series)
// Will also add the missing IMEI device.

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "X240", "_IMEI", 0)
{
#endif
    Device(_SB.PCI0.IMEI) { Name(_ADR, 0x00160000) }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF

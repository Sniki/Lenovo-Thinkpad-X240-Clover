// USB Port Injector for Lenovo ThinkPad X240 (TouchScreen)

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "X240", "_USB", 0)
{
#endif
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            "HUB1", Package()
            {
                "port-count", Buffer() { 8, 0, 0, 0 },
                "ports", Package()
                {
                    "HP15", Package() // TouchScreen
                    {
                        "portType", 0,
                        "port", Buffer() { 5, 0, 0, 0 },
                    },
                },
            },
            "EH01", Package()
            {
                "port-count", Buffer() { 8, 0, 0, 0 },
                "ports", Package()
                {
                    "PR11", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                 },
            },
            "8086_9c31", Package()
            {
                "port-count", Buffer() { 13, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // USB3 Port (2.0 Device)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HS02", Package() // USB3 Port (2.0 Device)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    "HS07", Package() // Internal Camera
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HS08", Package() // Bluetooth
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "SSP1", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 10, 0, 0, 0 },
                    },
                    "SSP2", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 11, 0, 0, 0 },
                    },
                },
            },
        })
    }
    // Disable ESEL to avoid USB Problems
    External(_SB.PCI0.XHC, DeviceObj)
    External(ZPTS, MethodObj)
    External(_SB.PCI0.XHC.PMEE, FieldUnitObj)
    Method(_SB.PCI0.XHC.ESEL)
    {
        // do nothing
    }
    // fix "auto start after shutdown if a USB Device is Plugged In"
    Method(_PTS, 1)
    {
        ZPTS(Arg0)
        If (5 == Arg0)
        {
            \_SB.PCI0.XHC.PMEE = 0
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF

# Get platform
win32 {
    msvc*{
    MSVC_VER = $$(VisualStudioVersion)
    _INT=$$section(MSVC_VER, ".", 0, -2)
    equals(_INT, 14): PLATFORM = VS2015
    equals(_INT, 15): PLATFORM = VS2017
    equals(_INT, 16): PLATFORM = VS2019
    equals(_INT, 17): PLATFORM = VS2022
    }
    else: PLATFORM = MinGW
}
else {
    PLATFORM = unix
}
#========== Get architecture information ==========#
contains(QT_ARCH, i386): CUR_ARCH = x86
contains(QT_ARCH, x86_64): CUR_ARCH = x64

#========== Get platform information ==========#
win32 {
    msvc*{
    MSVC_VER = $$(VisualStudioVersion)
    _INT=$$section(MSVC_VER, ".", 0, -2)
    equals(_INT, 13): PLATFORM = VS2013
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

#========== Get build configuration ==========#
CONFIG(release, debug|release): BUILD_CONFIG = release
CONFIG(debug, debug|release): BUILD_CONFIG = debug

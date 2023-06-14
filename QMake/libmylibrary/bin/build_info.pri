# ATTENTION: Do not define specific variable in this file (i.e: LIB_NAME = m070_zmq_aux). Because this file is used from multiple sources.
# Get architecture
contains(QT_ARCH, i386): CUR_ARCH = x86
contains(QT_ARCH, x86_64): CUR_ARCH = x64

# Get platform
include(platform_info.pri)

# Get build config
CONFIG(release, debug|release): BUILD_CONFIG = release
CONFIG(debug, debug|release): BUILD_CONFIG = debug

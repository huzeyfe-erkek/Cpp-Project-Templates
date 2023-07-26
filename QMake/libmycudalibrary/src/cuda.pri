#========== Settings ==========#
CUDA_ARCH = sm_52 # Type of CUDA architecture
CUDA_OBJECTS_DIR = $$OUTDIR/cuda
NVCC_OPTIONS = -Dlibmycudalibrary_BUILD --std=c++17 -arch=$$CUDA_ARCH --use_fast_math 

#========== Include paths & Libs ==========#
OTHER_FILES += $$CUDA_SOURCES

CUDA_INCLUDEPATH = $$join(INCLUDEPATH,'" -I"','-I"','"')

QMAKE_LIBDIR += $$CUDA_PATH/lib/x64

#========== Setup CUDA compiler ==========#
win32: NVCC_PATH = \"$$CUDA_PATH/bin/nvcc.exe\"
else:unix: NVCC_PATH = \"$$CUDA_PATH/bin/nvcc\"

cuda.input = CUDA_SOURCES
cuda.output = $$CUDA_OBJECTS_DIR/${QMAKE_FILE_BASE}_cuda.o
cuda.dependency_type = TYPE_C

cuda.commands = $$NVCC_PATH -m64 $$NVCC_OPTIONS $$CUDA_INCLUDEPATH $$CUDA_LIBS -c -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_NAME} 

win32:CONFIG(debug, debug|release): cuda.commands += -Xcompiler "/wd4819,/EHsc,/W3,/nologo,/Od,/Zi,/RTC1,/MDd" -D_DEBUG  
win32:CONFIG(release, debug|release): cuda.commands += -Xcompiler "/wd4819,/EHsc,/W3,/nologo,/O2,/Zi,/MD"

unix:CONFIG(debug, debug|release): cuda.commands += -Xcompiler -fPIC -O0 -D_DEBUG 
unix:CONFIG(release, debug|release): cuda.commands += -Xcompiler -fPIC -O3

QMAKE_EXTRA_COMPILERS += cuda


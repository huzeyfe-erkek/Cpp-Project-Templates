#!/bin/bash
# 2024.07.07
# Huzeyfe Erkek, huzeyfe.erkek@outlook.com

function fn_libmylibrary {
    keyString="$1"
    libraryName="$2"
    dstFullPath="$3"

    # Copy source folder and contents
    cp -a $keyString $dstFullPath

    # (1) Rename global header file in include directory
    mv $dstFullPath/include/${keyString}_global.h $dstFullPath/include/${libraryName}_global.h

    # (2) Open include/${libraryName}_global.h and update header guard, library build definition and export definition.
    tmp=$dstFullPath/include/${libraryName}_global.h
    sed -i -e "s/${keyString^^}_GLOBAL_H/${libraryName^^}_GLOBAL_H/g" $tmp # Header guard
    sed -i -e "s/${keyString}_BUILD/${libraryName}_BUILD/g" $tmp # Library build definition
    sed -i -e "s/${keyString^^}_EXPORT/${libraryName^^}_EXPORT/g" $tmp # Export definition

    # (3) Rename ${libraryName}-src.pro
    mv $dstFullPath/${keyString}-src.pro $dstFullPath/${libraryName}-src.pro

    # (4) Update ${libraryName}-src.pro
    tmp=$dstFullPath/${libraryName}-src.pro
    sed -i -e "s/${keyString}_BUILD/${libraryName}_BUILD/g" $tmp # Library build definition
    sed -i -e "s/TARGET = ${keyString}/TARGET = ${libraryName}/g" $tmp # Target
    sed -i -e "s/${keyString^^}_VERSION_/${libraryName^^}_VERSION_/g" $tmp # Version information
    sed -i -e "s/${keyString}.pri/${libraryName}.pri/g" $tmp # Library pri
    sed -i -e "s/${keyString^^}_BUILD_PATH/${libraryName^^}_BUILD_PATH/g" $tmp # Update library build path

    # (5) Rename ${libraryName}.pro
    mv $dstFullPath/${keyString}.pro $dstFullPath/${libraryName}.pro

    # (6) Open ${libraryName}.pro and update *.pro files
    sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/${libraryName}.pro

    # (7) Rename ${libraryName}-test.pro
    mv $dstFullPath/${keyString}-test.pro $dstFullPath/${libraryName}-test.pro

    # (8) Open ${libraryName}-test.pro and update include(...) commands
    sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/${libraryName}-test.pro

    # (9) Rename ${libraryName}.pri
    mv $dstFullPath/${keyString}.pri $dstFullPath/${libraryName}.pri

    # (10) Open ${libraryName}.pri and update library name and library build path
    tmp=$dstFullPath/${libraryName}.pri
    sed -i -e "s/${keyString}/${libraryName}/g" $tmp
    sed -i -e "s/${keyString^^}_BUILD_PATH/${libraryName^^}_BUILD_PATH/g" $tmp # Update library build path

    # (11) Update README.md
    sed -i -e "s/${keyString}/${libraryName}/g" $dstFullPath/README.md
    sed -i -e "s/${keyString^^}/${libraryName^^}/g" $dstFullPath/README.md
}

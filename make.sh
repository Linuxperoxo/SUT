#!/bin/bash
#
# 
#  
#  
#      /--------------------------------------------O
#      |                                            |
#      |  COPYRIGHT : (c) 2024 per Linuxperoxo.     |
#      |  AUTHOR    : Linuxperoxo                   |
#      |  FILE      : make.sh                       |
#      |                                            |
#      O--------------------------------------------/
#  
#  
#  


BIN_NAME="sut"
ROOT_PROJECT="$(pwd)"
SRC_DIR="${ROOT_PROJECT}/src"
INC_DIR="${ROOT_PROJECT}/include"
BUILD_DIR="${ROOT_PROJECT}/build"
OBJ_DIR="${BUILD_DIR}/obj"
BIN_DIR="${BUILD_DIR}/bin"
ASSEMBLER="/usr/bin/nasm"
ASSEMBLER_ARCH="elf64"
LINKER="/usr/bin/ld"

ld()
{
  "${LINKER}" -v "${OBJ_DIR}/"*.o -o "${BIN_DIR}/${BIN_NAME}"
  
  if [ "$?" != 0 ]; then
    echo -e "\e[31mERROR\e[0m : Failed to make project"
    exit 1;
  fi
}

make_obj()
{
  cd "${SRC_DIR}"

  for i in *.asm; do
    out="${i%.*}"
    
    "${ASSEMBLER}" -f "${ASSEMBLER_ARCH}" "${i}" -o "${BUILD_DIR}/obj/${out}.o" 
    
    if [ "$?" != 0 ]; then
    echo -e "\e[31mERROR\e[0m : Failed to make project"
    exit 1;
    fi
  done

  cd "${INC_DIR}"
  
  for i in *.asm; do
    out="${i%.*}"
    
    "${ASSEMBLER}" -f "${ASSEMBLER_ARCH}" "${i}" -o "${BUILD_DIR}/obj/${out}.o" 
    
    if [ "$?" != 0 ]; then
    echo -e "\e[31mERROR\e[0m : Failed to make project"
    exit 1;
    fi
  done
}

mkdir -p "${OBJ_DIR}" "${BIN_DIR}"

case "${1}" in
  clean) 
    rm -rf "${BUILD_DIR}"
  ;;
  
  build) 
    make_obj
    ld
    exit 0;
  ;;

  *)
    echo "/===================================O"
    echo "| build -> to compile source        |"
    echo "| clean -> to clean build directory |"
    echo "O===================================/"
  ;;
esac

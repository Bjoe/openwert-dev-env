if("$ENV{TOOLCHAIN_DIR}" STREQUAL "")
   message(FATAL_ERROR "Environment variable 'TOOLCHAIN_DIR' is not set")
endif()

if("$ENV{STAGING_DIR}" STREQUAL "")
  message(FATAL_ERROR "Environment variable 'STAGING_DIR' is not set")
endif()

if("$ENV{CROSS_COMPILE_TOOLCHAIN_PREFIX}" STREQUAL "")
  message(FATAL_ERROR "Environment variable 'CROSS_COMPILE_TOOLCHAIN_PREFIX' is not set")
endif()

# set system name, this sets the variable CMAKE_CROSSCOMPILING
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)

set(CROSS_COMPILE_TOOLCHAIN_PATH  "$ENV{TOOLCHAIN_DIR}/bin")
set(CROSS_COMPILE_SYSROOT         "$ENV{STAGING_DIR}/usr/include")
set(SYSROOT_COMPILE_FLAG "--sysroot=${CROSS_COMPILE_SYSROOT}")

set(OPENWRT_FLAGS "") #-pipe -march=armv7-a -mcpu=cortex-a9 -mtune=cortex-a9 -msoft-float -mfloat-abi=soft -fno-caller-saves -fno-plt -DNEED_PRINTF=1") # http://www.dd-wrt.com/phpBB2/viewtopic.php?p=552124

set(CMAKE_C_FLAGS   "${SYSROOT_COMPILE_FLAG} ${OPENWRT_FLAGS} ${CMAKE_C_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${SYSROOT_COMPILE_FLAG} ${OPENWRT_FLAGS} -std=c++17 ${CMAKE_CXX_FLAGS}" CACHE STRING "" FORCE)

# The (...)_PREFIX variable name refers to the Cross Compiler Triplet
set(TOOLCHAIN_PATH_AND_PREFIX ${CROSS_COMPILE_TOOLCHAIN_PATH}/$ENV{CROSS_COMPILE_TOOLCHAIN_PREFIX})
set(CMAKE_C_COMPILER     "${TOOLCHAIN_PATH_AND_PREFIX}-gcc"     CACHE PATH "C compiler")
set(CMAKE_CXX_COMPILER   "${TOOLCHAIN_PATH_AND_PREFIX}-g++"     CACHE PATH "C++ compiler")
set(CMAKE_ASM_COMPILER   "${TOOLCHAIN_PATH_AND_PREFIX}-as"      CACHE PATH "Assembler")
set(CMAKE_C_PREPROCESSOR "${TOOLCHAIN_PATH_AND_PREFIX}-cpp"     CACHE PATH "Preprocessor")
set(CMAKE_STRIP          "${TOOLCHAIN_PATH_AND_PREFIX}-strip"   CACHE PATH "strip")
if( EXISTS "${TOOLCHAIN_PATH_AND_PREFIX}-gcc-ar" )
  # Prefer gcc-ar over binutils ar: https://gcc.gnu.org/wiki/LinkTimeOptimizationFAQ
  set(CMAKE_AR           "${TOOLCHAIN_PATH_AND_PREFIX}-gcc-ar"  CACHE PATH "Archiver" )
else()
  set(CMAKE_AR           "${TOOLCHAIN_PATH_AND_PREFIX}-ar"      CACHE PATH "Archiver" )
endif()
set(CMAKE_LINKER         "${TOOLCHAIN_PATH_AND_PREFIX}-ld"      CACHE PATH "Linker" )
set(CMAKE_NM             "${TOOLCHAIN_PATH_AND_PREFIX}-nm"      CACHE PATH "nm" )
set(CMAKE_OBJCOPY        "${TOOLCHAIN_PATH_AND_PREFIX}-objcopy" CACHE PATH "objcopy" )
set(CMAKE_OBJDUMP        "${TOOLCHAIN_PATH_AND_PREFIX}-objdump" CACHE PATH "objdump" )
set(CMAKE_RANLIB         "${TOOLCHAIN_PATH_AND_PREFIX}-ranlib"  CACHE PATH "ranlib" )
set(CMAKE_RC_COMPILER    "${TOOLCHAIN_PATH_AND_PREFIX}-windres" CACHE PATH "WindowsRC" )
set(CMAKE_Fortran_COMPILER "${TOOLCHAIN_PATH_AND_PREFIX}-gfortran" CACHE PATH "gfortran" )

set(CMAKE_FIND_ROOT_PATH "$ENV{STAGING_DIR};$ENV{TOOLCHAIN_DIR}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Set CMAKE_CXX_STANDARD to cache to override project local value if present.
# FORCE added in case CMAKE_CXX_STANDARD already set in cache
# (e.g. set before 'project' by user).
set(CMAKE_CXX_STANDARD 14 CACHE STRING "C++ Standard (toolchain)" FORCE)
set(CMAKE_CXX_STANDARD_REQUIRED YES CACHE BOOL "C++ Standard required" FORCE)
set(CMAKE_CXX_EXTENSIONS NO CACHE BOOL "C++ Standard extensions" FORCE)

set(OPENWRT 1 CACHE INTERNAL "")

# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
# Copyright (c) 2024.

include(CMakePrintHelpers)

set(CMAKE_POLICY_DEFAULT_CMP0175 "OLD" CACHE STRING "")
set(CMAKE_C_COMPILER_LAUNCHER "$ENV{CMAKE_CXX_COMPILER_LAUNCHER}" CACHE STRING "")
set(CMAKE_CXX_COMPILER_LAUNCHER "$ENV{CMAKE_CXX_COMPILER_LAUNCHER}" CACHE STRING "")
set(CMAKE_OSX_ARCHITECTURES "$ENV{CMAKE_OSX_ARCHITECTURES}" CACHE STRING "")
set(CMAKE_VERBOSE_MAKEFILE ON CACHE BOOL "")

set(LLVM_ENABLE_PROJECTS "llvm;mlir" CACHE STRING "")
set(LLVM_EXTERNAL_PROJECTS "circt" CACHE STRING "")
set(LLVM_EXTERNAL_CIRCT_SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}" CACHE STRING "")

# on
set(CIRCT_BINDINGS_PYTHON_ENABLED ON CACHE BOOL "")
set(MLIR_ENABLE_ROCM_CONVERSIONS ON CACHE BOOL "")
set(LLVM_TARGETS_TO_BUILD "host;AMDGPU;NVPTX" CACHE STRING "")

# LLVM options
set(LLVM_BUILD_UTILS ON CACHE BOOL "")
set(LLVM_INCLUDE_TOOLS ON CACHE BOOL "")
set(LLVM_INSTALL_UTILS ON CACHE BOOL "")

# useful things
set(LLVM_ENABLE_ASSERTIONS ON CACHE BOOL "")
set(LLVM_ENABLE_WARNINGS ON CACHE BOOL "")
set(LLVM_FORCE_ENABLE_STATS ON CACHE BOOL "")
# because AMD target td files are insane...
set(LLVM_OPTIMIZED_TABLEGEN ON CACHE BOOL "")
set(LLVM_ENABLE_RTTI ON CACHE BOOL "")
set(LLVM_CCACHE_BUILD ON CACHE BOOL "")

# MLIR options

set(MLIR_ENABLE_BINDINGS_PYTHON ON CACHE BOOL "")
set(MLIR_ENABLE_EXECUTION_ENGINE ON CACHE BOOL "")
set(MLIR_ENABLE_SPIRV_CPU_RUNNER ON CACHE BOOL "")

set(LLVM_BUILD_LLVM_DYLIB OFF CACHE BOOL "")
set(LLVM_LINK_LLVM_DYLIB OFF CACHE BOOL "")
set(MLIR_LINK_MLIR_DYLIB OFF CACHE BOOL "")
set(MLIR_ENABLE_EXECUTION_ENGINE OFF CACHE BOOL "")
set(MLIR_ENABLE_ROCM_RUNNER OFF CACHE BOOL "")

set(LLVM_BUILD_DOCS OFF CACHE BOOL "")
set(LLVM_ENABLE_OCAMLDOC OFF CACHE BOOL "")
set(LLVM_ENABLE_BINDINGS OFF CACHE BOOL "")
set(LLVM_BUILD_BENCHMARKS OFF CACHE BOOL "")
set(LLVM_BUILD_EXAMPLES OFF CACHE BOOL "")
set(LLVM_ENABLE_LIBCXX OFF CACHE BOOL "")
set(LLVM_ENABLE_LIBCXX OFF CACHE BOOL "")
set(LLVM_ENABLE_LIBEDIT OFF CACHE BOOL "")
set(LLVM_ENABLE_LIBXML2 OFF CACHE BOOL "")
set(LLVM_ENABLE_TERMINFO OFF CACHE BOOL "")

set(LLVM_ENABLE_CRASH_OVERRIDES OFF CACHE BOOL "")
set(LLVM_ENABLE_Z3_SOLVER OFF CACHE BOOL "")
set(LLVM_ENABLE_ZLIB OFF CACHE BOOL "")
set(LLVM_ENABLE_ZSTD OFF CACHE BOOL "")
set(LLVM_INCLUDE_BENCHMARKS OFF CACHE BOOL "")
set(LLVM_INCLUDE_DOCS OFF CACHE BOOL "")
set(LLVM_INCLUDE_EXAMPLES OFF CACHE BOOL "")
set(LLVM_INCLUDE_GO_TESTS OFF CACHE BOOL "")

### Distributions ###

set(LLVM_INSTALL_TOOLCHAIN_ONLY OFF CACHE BOOL "")
set(LLVM_DISTRIBUTION_COMPONENTS
    # triggers LLVMConfig.cmake and etc
    cmake-exports
    llvm-config
    llvm-headers
    llvm-libraries

    FileCheck
    not
    MLIRPythonModules
    # triggers MLIRConfig.cmake and etc
    mlir-cmake-exports
    mlir-headers
    mlir-libraries
    mlir-python-sources
    mlir-tblgen

    circt-cmake-exports
    circt-headers
    circt-libraries
    CIRCTPythonModules
    CACHE STRING "")

get_cmake_property(_variableNames VARIABLES)
list(SORT _variableNames)
cmake_print_variables(${_variableNames})

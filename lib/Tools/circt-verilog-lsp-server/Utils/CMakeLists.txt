##===----------------------------------------------------------------------===//
##
## This directory contains the utilities for the Verilog LSP server. slang
## currently requires RTTI but LLVM may not be built with RTTI. In that case
## functions within VerilogServer.cpp use RTTI of LLVM, it will cause
## compilation error. To avoid this, we specialize these functions in this
## directory.
##
##===----------------------------------------------------------------------===//

add_circt_library(CIRCTVerilogLspServerUtils
  LSPUtils.cpp

  LINK_LIBS PUBLIC
  MLIRLspServerSupportLib
)

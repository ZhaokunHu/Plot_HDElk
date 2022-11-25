// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VDut.h for the primary calling header

#ifndef VERILATED_VDUT___024ROOT_H_
#define VERILATED_VDUT___024ROOT_H_  // guard

#include "verilated.h"

class VDut__Syms;

class VDut___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(io_a,7,0);
    VL_IN8(io_b,7,0);
    VL_IN8(io_c,7,0);
    VL_OUT8(io_result,7,0);
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VstlIterCount;
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<0> __VactTriggered;
    VlTriggerVec<0> __VnbaTriggered;

    // INTERNAL VARIABLES
    VDut__Syms* const vlSymsp;

    // CONSTRUCTORS
    VDut___024root(VDut__Syms* symsp, const char* name);
    ~VDut___024root();
    VL_UNCOPYABLE(VDut___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard

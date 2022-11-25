// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDut.h for the primary calling header

#include "verilated.h"

#include "VDut__Syms.h"
#include "VDut___024root.h"

void VDut___024root___ctor_var_reset(VDut___024root* vlSelf);

VDut___024root::VDut___024root(VDut__Syms* symsp, const char* name)
    : VerilatedModule{name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VDut___024root___ctor_var_reset(this);
}

void VDut___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

VDut___024root::~VDut___024root() {
}

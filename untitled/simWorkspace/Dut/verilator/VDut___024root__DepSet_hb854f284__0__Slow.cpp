// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDut.h for the primary calling header

#include "verilated.h"

#include "VDut__Syms.h"
#include "VDut___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void VDut___024root___dump_triggers__stl(VDut___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void VDut___024root___eval_triggers__stl(VDut___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root___eval_triggers__stl\n"); );
    // Body
    vlSelf->__VstlTriggered.at(0U) = (0U == vlSelf->__VstlIterCount);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VDut___024root___dump_triggers__stl(vlSelf);
    }
#endif
}

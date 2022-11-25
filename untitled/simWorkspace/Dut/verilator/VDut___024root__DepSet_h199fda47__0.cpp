// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDut.h for the primary calling header

#include "verilated.h"

#include "VDut___024root.h"

VL_INLINE_OPT void VDut___024root___ico_sequent__TOP__0(VDut___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root___ico_sequent__TOP__0\n"); );
    // Body
    vlSelf->io_result = (0xffU & (((IData)(vlSelf->io_a) 
                                   + (IData)(vlSelf->io_b)) 
                                  - (IData)(vlSelf->io_c)));
}

void VDut___024root___eval_ico(VDut___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root___eval_ico\n"); );
    // Body
    if (vlSelf->__VicoTriggered.at(0U)) {
        VDut___024root___ico_sequent__TOP__0(vlSelf);
    }
}

void VDut___024root___eval_act(VDut___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root___eval_act\n"); );
}

void VDut___024root___eval_nba(VDut___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root___eval_nba\n"); );
}

void VDut___024root___eval_triggers__ico(VDut___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void VDut___024root___dump_triggers__ico(VDut___024root* vlSelf);
#endif  // VL_DEBUG
void VDut___024root___eval_triggers__act(VDut___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void VDut___024root___dump_triggers__act(VDut___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void VDut___024root___dump_triggers__nba(VDut___024root* vlSelf);
#endif  // VL_DEBUG

void VDut___024root___eval(VDut___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root___eval\n"); );
    // Init
    CData/*0:0*/ __VicoContinue;
    VlTriggerVec<0> __VpreTriggered;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    vlSelf->__VicoIterCount = 0U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        __VicoContinue = 0U;
        VDut___024root___eval_triggers__ico(vlSelf);
        if (vlSelf->__VicoTriggered.any()) {
            __VicoContinue = 1U;
            if ((0x64U < vlSelf->__VicoIterCount)) {
#ifdef VL_DEBUG
                VDut___024root___dump_triggers__ico(vlSelf);
#endif
                VL_FATAL_MT("C:/Users/Administrator/Desktop/spinalhdl_coding/untitled/tmp/job_1/Dut.v", 6, "", "Input combinational region did not converge.");
            }
            vlSelf->__VicoIterCount = ((IData)(1U) 
                                       + vlSelf->__VicoIterCount);
            VDut___024root___eval_ico(vlSelf);
        }
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        __VnbaContinue = 0U;
        vlSelf->__VnbaTriggered.clear();
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            vlSelf->__VactContinue = 0U;
            VDut___024root___eval_triggers__act(vlSelf);
            if (vlSelf->__VactTriggered.any()) {
                vlSelf->__VactContinue = 1U;
                if ((0x64U < vlSelf->__VactIterCount)) {
#ifdef VL_DEBUG
                    VDut___024root___dump_triggers__act(vlSelf);
#endif
                    VL_FATAL_MT("C:/Users/Administrator/Desktop/spinalhdl_coding/untitled/tmp/job_1/Dut.v", 6, "", "Active region did not converge.");
                }
                vlSelf->__VactIterCount = ((IData)(1U) 
                                           + vlSelf->__VactIterCount);
                __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
                vlSelf->__VnbaTriggered.set(vlSelf->__VactTriggered);
                VDut___024root___eval_act(vlSelf);
            }
        }
        if (vlSelf->__VnbaTriggered.any()) {
            __VnbaContinue = 1U;
            if ((0x64U < __VnbaIterCount)) {
#ifdef VL_DEBUG
                VDut___024root___dump_triggers__nba(vlSelf);
#endif
                VL_FATAL_MT("C:/Users/Administrator/Desktop/spinalhdl_coding/untitled/tmp/job_1/Dut.v", 6, "", "NBA region did not converge.");
            }
            __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
            VDut___024root___eval_nba(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
void VDut___024root___eval_debug_assertions(VDut___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root___eval_debug_assertions\n"); );
}
#endif  // VL_DEBUG

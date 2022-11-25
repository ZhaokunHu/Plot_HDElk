// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VDut__Syms.h"


VL_ATTR_COLD void VDut___024root__trace_init_sub__TOP__0(VDut___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBus(c+1,"io_a", false,-1, 7,0);
    tracep->declBus(c+2,"io_b", false,-1, 7,0);
    tracep->declBus(c+3,"io_c", false,-1, 7,0);
    tracep->declBus(c+4,"io_result", false,-1, 7,0);
    tracep->pushNamePrefix("Dut ");
    tracep->declBus(c+1,"io_a", false,-1, 7,0);
    tracep->declBus(c+2,"io_b", false,-1, 7,0);
    tracep->declBus(c+3,"io_c", false,-1, 7,0);
    tracep->declBus(c+4,"io_result", false,-1, 7,0);
    tracep->popNamePrefix(1);
}

VL_ATTR_COLD void VDut___024root__trace_init_top(VDut___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root__trace_init_top\n"); );
    // Body
    VDut___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VDut___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VDut___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VDut___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VDut___024root__trace_register(VDut___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&VDut___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&VDut___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&VDut___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VDut___024root__trace_full_sub_0(VDut___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VDut___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root__trace_full_top_0\n"); );
    // Init
    VDut___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDut___024root*>(voidSelf);
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VDut___024root__trace_full_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VDut___024root__trace_full_sub_0(VDut___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDut___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullCData(oldp+1,(vlSelf->io_a),8);
    bufp->fullCData(oldp+2,(vlSelf->io_b),8);
    bufp->fullCData(oldp+3,(vlSelf->io_c),8);
    bufp->fullCData(oldp+4,(vlSelf->io_result),8);
}

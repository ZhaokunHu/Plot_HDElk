// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VDut.h"
#include "VDut__Syms.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VDut::VDut(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VDut__Syms(contextp(), _vcname__, this)}
    , io_a{vlSymsp->TOP.io_a}
    , io_b{vlSymsp->TOP.io_b}
    , io_c{vlSymsp->TOP.io_c}
    , io_result{vlSymsp->TOP.io_result}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

VDut::VDut(const char* _vcname__)
    : VDut(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VDut::~VDut() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VDut___024root___eval_debug_assertions(VDut___024root* vlSelf);
#endif  // VL_DEBUG
void VDut___024root___eval_static(VDut___024root* vlSelf);
void VDut___024root___eval_initial(VDut___024root* vlSelf);
void VDut___024root___eval_settle(VDut___024root* vlSelf);
void VDut___024root___eval(VDut___024root* vlSelf);

void VDut::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VDut::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VDut___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VDut___024root___eval_static(&(vlSymsp->TOP));
        VDut___024root___eval_initial(&(vlSymsp->TOP));
        VDut___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VDut___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
}

//============================================================
// Events and timing
bool VDut::eventsPending() { return false; }

uint64_t VDut::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* VDut::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VDut___024root___eval_final(VDut___024root* vlSelf);

VL_ATTR_COLD void VDut::final() {
    VDut___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VDut::hierName() const { return vlSymsp->name(); }
const char* VDut::modelName() const { return "VDut"; }
unsigned VDut::threads() const { return 1; }
std::unique_ptr<VerilatedTraceConfig> VDut::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void VDut___024root__trace_init_top(VDut___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VDut___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VDut___024root*>(voidSelf);
    VDut__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->scopeEscape(' ');
    tracep->pushNamePrefix(std::string{vlSymsp->name()} + ' ');
    VDut___024root__trace_init_top(vlSelf, tracep);
    tracep->popNamePrefix();
    tracep->scopeEscape('.');
}

VL_ATTR_COLD void VDut___024root__trace_register(VDut___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VDut::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (tfp->isOpen()) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'VDut::trace()' shall not be called after 'VerilatedVcdC::open()'.");
    }
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addModel(this);
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    VDut___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}

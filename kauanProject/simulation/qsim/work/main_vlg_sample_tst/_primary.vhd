library verilog;
use verilog.vl_types.all;
entity main_vlg_sample_tst is
    port(
        CLOCK           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end main_vlg_sample_tst;

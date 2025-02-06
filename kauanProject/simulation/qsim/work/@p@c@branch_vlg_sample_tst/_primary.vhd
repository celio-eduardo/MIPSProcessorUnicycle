library verilog;
use verilog.vl_types.all;
entity PCBranch_vlg_sample_tst is
    port(
        PCATUAL         : in     vl_logic_vector(31 downto 0);
        SignalExtended  : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end PCBranch_vlg_sample_tst;

library verilog;
use verilog.vl_types.all;
entity PCBranch_vlg_check_tst is
    port(
        PCBranch        : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end PCBranch_vlg_check_tst;

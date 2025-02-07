library verilog;
use verilog.vl_types.all;
entity mult_divide_vlg_check_tst is
    port(
        MFHI            : in     vl_logic_vector(31 downto 0);
        MFLO            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end mult_divide_vlg_check_tst;

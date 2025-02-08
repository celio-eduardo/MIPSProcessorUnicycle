library verilog;
use verilog.vl_types.all;
entity DataRamtest_vlg_check_tst is
    port(
        DATA            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end DataRamtest_vlg_check_tst;

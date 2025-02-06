library verilog;
use verilog.vl_types.all;
entity JumpEndereco_test_vlg_check_tst is
    port(
        PCJump          : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end JumpEndereco_test_vlg_check_tst;

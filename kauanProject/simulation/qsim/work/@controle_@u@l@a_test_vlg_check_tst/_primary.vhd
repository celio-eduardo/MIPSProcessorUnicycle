library verilog;
use verilog.vl_types.all;
entity Controle_ULA_test_vlg_check_tst is
    port(
        ULAopcode       : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end Controle_ULA_test_vlg_check_tst;

library verilog;
use verilog.vl_types.all;
entity Controle_ULA_test_vlg_sample_tst is
    port(
        Funct           : in     vl_logic_vector(5 downto 0);
        OpULA           : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end Controle_ULA_test_vlg_sample_tst;

library verilog;
use verilog.vl_types.all;
entity JumpEndereco_test_vlg_sample_tst is
    port(
        Endereco        : in     vl_logic_vector(25 downto 0);
        PC              : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end JumpEndereco_test_vlg_sample_tst;

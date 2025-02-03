library verilog;
use verilog.vl_types.all;
entity JumpEndereco_test is
    port(
        PCJump          : out    vl_logic_vector(31 downto 0);
        Endereco        : in     vl_logic_vector(25 downto 0);
        PC              : in     vl_logic_vector(31 downto 0)
    );
end JumpEndereco_test;

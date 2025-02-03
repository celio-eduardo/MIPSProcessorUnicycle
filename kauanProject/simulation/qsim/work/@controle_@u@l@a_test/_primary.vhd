library verilog;
use verilog.vl_types.all;
entity Controle_ULA_test is
    port(
        ULAopcode       : out    vl_logic_vector(3 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        OpULA           : in     vl_logic_vector(1 downto 0)
    );
end Controle_ULA_test;

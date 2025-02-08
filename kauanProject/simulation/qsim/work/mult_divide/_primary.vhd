library verilog;
use verilog.vl_types.all;
entity mult_divide is
    port(
        MFHI            : out    vl_logic_vector(31 downto 0);
        Funct           : in     vl_logic;
        DATAA           : in     vl_logic_vector(31 downto 0);
        DATAB           : in     vl_logic_vector(31 downto 0);
        MFLO            : out    vl_logic_vector(31 downto 0)
    );
end mult_divide;

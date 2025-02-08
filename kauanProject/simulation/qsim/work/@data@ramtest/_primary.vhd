library verilog;
use verilog.vl_types.all;
entity DataRamtest is
    port(
        DATA            : out    vl_logic_vector(31 downto 0);
        En              : in     vl_logic;
        Clock           : in     vl_logic;
        Endereco        : in     vl_logic_vector(13 downto 0);
        Input           : in     vl_logic_vector(31 downto 0)
    );
end DataRamtest;

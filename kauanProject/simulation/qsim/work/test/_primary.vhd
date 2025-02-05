library verilog;
use verilog.vl_types.all;
entity test is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        EscreveREG      : out    vl_logic;
        CLOCK           : in     vl_logic;
        INSTRUCAO       : out    vl_logic_vector(31 downto 0);
        IROUTPUT        : out    vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        ULAA            : out    vl_logic_vector(31 downto 0);
        ULAB            : out    vl_logic_vector(31 downto 0);
        ULAOPCODE       : out    vl_logic_vector(3 downto 0);
        ULAR            : out    vl_logic_vector(31 downto 0)
    );
end test;

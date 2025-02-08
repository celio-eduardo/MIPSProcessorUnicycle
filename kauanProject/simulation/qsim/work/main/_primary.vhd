library verilog;
use verilog.vl_types.all;
entity main is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        Clock           : out    vl_logic;
        MiniCLOCK       : in     vl_logic;
        UnknownOpcode   : out    vl_logic;
        Jump            : out    vl_logic;
        JR              : out    vl_logic;
        OVERFLOW        : out    vl_logic;
        at              : out    vl_logic_vector(31 downto 0);
        INSTRUCAO       : out    vl_logic_vector(31 downto 0);
        IROUTPUT        : out    vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        ra              : out    vl_logic_vector(31 downto 0);
        t0              : out    vl_logic_vector(31 downto 0);
        t1              : out    vl_logic_vector(31 downto 0);
        ULAA            : out    vl_logic_vector(31 downto 0);
        ULAB            : out    vl_logic_vector(31 downto 0);
        ULAOPCODE       : out    vl_logic_vector(3 downto 0);
        zero            : out    vl_logic_vector(31 downto 0)
    );
end main;

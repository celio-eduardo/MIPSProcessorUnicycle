library verilog;
use verilog.vl_types.all;
entity main_vlg_check_tst is
    port(
        at              : in     vl_logic_vector(31 downto 0);
        Clock           : in     vl_logic;
        INSTRUCAO       : in     vl_logic_vector(31 downto 0);
        IROUTPUT        : in     vl_logic_vector(31 downto 0);
        JR              : in     vl_logic;
        Jump            : in     vl_logic;
        PC              : in     vl_logic_vector(31 downto 0);
        ra              : in     vl_logic_vector(31 downto 0);
        t0              : in     vl_logic_vector(31 downto 0);
        t1              : in     vl_logic_vector(31 downto 0);
        ULAB            : in     vl_logic_vector(31 downto 0);
        ULAOPCODE       : in     vl_logic_vector(3 downto 0);
        UnknownOpcode   : in     vl_logic;
        zero            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end main_vlg_check_tst;

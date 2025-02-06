library verilog;
use verilog.vl_types.all;
entity main_vlg_check_tst is
    port(
        at              : in     vl_logic_vector(31 downto 0);
        EscreveREG      : in     vl_logic;
        INSTRUCAO       : in     vl_logic_vector(31 downto 0);
        IROUTPUT        : in     vl_logic_vector(31 downto 0);
        jal             : in     vl_logic;
        PC              : in     vl_logic_vector(31 downto 0);
        ra              : in     vl_logic_vector(31 downto 0);
        s0              : in     vl_logic_vector(31 downto 0);
        s1              : in     vl_logic_vector(31 downto 0);
        t0              : in     vl_logic_vector(31 downto 0);
        t1              : in     vl_logic_vector(31 downto 0);
        ULAB            : in     vl_logic_vector(31 downto 0);
        ULAOPCODE       : in     vl_logic_vector(3 downto 0);
        ULAR            : in     vl_logic_vector(31 downto 0);
        zero            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end main_vlg_check_tst;

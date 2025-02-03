library verilog;
use verilog.vl_types.all;
entity test_vlg_check_tst is
    port(
        EscreveREG      : in     vl_logic;
        INSTRUCAO       : in     vl_logic_vector(31 downto 0);
        IROUTPUT        : in     vl_logic_vector(31 downto 0);
        PC              : in     vl_logic_vector(31 downto 0);
        PCJUMP          : in     vl_logic_vector(31 downto 0);
        ULAA            : in     vl_logic_vector(31 downto 0);
        ULAB            : in     vl_logic_vector(31 downto 0);
        ULAOPCODE       : in     vl_logic_vector(3 downto 0);
        ULAR            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end test_vlg_check_tst;

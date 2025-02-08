library verilog;
use verilog.vl_types.all;
entity DataRamtest_vlg_sample_tst is
    port(
        Clock           : in     vl_logic;
        En              : in     vl_logic;
        Endereco        : in     vl_logic_vector(13 downto 0);
        Input           : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end DataRamtest_vlg_sample_tst;

library verilog;
use verilog.vl_types.all;
entity mult_divide_vlg_sample_tst is
    port(
        DATAA           : in     vl_logic_vector(31 downto 0);
        DATAB           : in     vl_logic_vector(31 downto 0);
        Funct           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mult_divide_vlg_sample_tst;

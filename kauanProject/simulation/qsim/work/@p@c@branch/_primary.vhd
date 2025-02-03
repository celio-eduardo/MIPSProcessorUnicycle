library verilog;
use verilog.vl_types.all;
entity PCBranch is
    port(
        PCBranch        : out    vl_logic_vector(31 downto 0);
        PCATUAL         : in     vl_logic_vector(31 downto 0);
        SignalExtended  : in     vl_logic_vector(31 downto 0)
    );
end PCBranch;

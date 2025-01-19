module MIPS_Processor_Unicycle #(
    parameter MIF_FILE_DATA = "mif/Data.mif",
    parameter MIF_FILE_INSTRUCTION = "mif/Instructions.mif",
    parameter BREG_SIZE = 5,
    parameter OPCODE_SIZE = 4,
    parameter TYPES_SIZE = 4,
    parameter WSIZE = 32
) (
    input wire clock,
    input wire keys_input,
    input wire reset,
    input wire run,
    input wire [2:0] nibble_view,
    input wire [7:0] keys,
    output wire [0:55] nibble_codes,
    output wire overflow,
    output wire unknown_op
);

    // Declaração dos componentes

    // MIPS_BREG
    MIPS_BREG #(
        .WSIZE(WSIZE)
    ) breg (
        .clock(clock),
        .reset(reset),
        .write_enable(write_enable),
        .readADDR1(readADDR1),
        .readADDR2(readADDR2),
        .writeADDR(writeADDR),
        .write_data(write_data),
        .Reg1(Reg1),
        .Reg2(Reg2)
    );

    // MIPS_Controller
    MIPS_Controller controller (
        .inst_opcode(inst_opcode),
        .inst_functor(inst_functor),
        .jump(jump),
        .branch(branch),
        .branchN(branchN),
        .memWrite(memWrite),
        .ALUsrc(ALUsrc),
        .regWrite(regWrite),
        .regDST(regDST),
        .memToReg(memToReg),
        .eret(eret),
        .unknown_opcode(unknown_opcode),
        .ALUop(ALUop),
        .jr(jr),
        .shamt(shamt)
    );

    // MIPS_Exception_Controller
    MIPS_Exception_Controller #(
        .WSIZE(WSIZE)
    ) exception_controller (
        .overflow(overflow),
        .unknown_opcode(unknown_opcode),
        .exception_ADDR(exception_ADDR),
        .exception(exception)
    );

    // MIPS_ULA
    MIPS_ULA #(
        .WSIZE(WSIZE)
    ) ula (
        .opcode(opcode),
        .A(A),
        .B(B),
        .R(R),
        .Z(Z),
        .O(O)
    );

    // Multiplexer2to1
    Multiplexer2to1 #(
        .WSIZE(WSIZE)
    ) mux2to1 (
        .input1(input1),
        .input2(input2),
        .selector(selector),
        .output(output)
    );

    // Multiplexer4to1
    Multiplexer4to1 #(
        .WSIZE(WSIZE)
    ) mux4to1 (
        .input1(input1),
        .input2(input2),
        .input3(input3),
        .input4(input4),
        .selector(selector),
        .output(output)
    );

    // NibbleDisplay
    NibbleDisplay nibble_display (
        .nibble(nibble),
        .display_code(display_code)
    );

    // NibbleDisplayConverter
    NibbleDisplayConverter nibble_converter (
        .input(input),
        .output(output)
    );

    // ProgramCounter
    ProgramCounter #(
        .WSIZE(WSIZE)
    ) pc (
        .clock(clock),
        .reset(reset),
        .write_enable(write_enable),
        .data(data),
        .output(output)
    );

    // RAM
    RAM #(
        .MIF_FILE(MIF_FILE_DATA)
    ) data_ram (
        .address(address),
        .clock(clock),
        .data(data),
        .wren(wren),
        .q(q)
    );

    RAM #(
        .MIF_FILE(MIF_FILE_INSTRUCTION)
    ) instruction_ram (
        .address(address),
        .clock(clock),
        .data(data),
        .wren(wren),
        .q(q)
    );

    // UnsignedAdder
    UnsignedAdder #(
        .WSIZE(WSIZE)
    ) adder (
        .input1(input1),
        .input2(input2),
        .output(output)
    );

    // Sinais internos
    wire write_enable;
    wire [4:0] readADDR1, readADDR2, writeADDR;
    wire [WSIZE-1:0] write_data, Reg1, Reg2;
    wire [5:0] inst_opcode, inst_functor;
    wire jump, branch, branchN, memWrite, ALUsrc, regWrite;
    wire [1:0] regDST, memToReg;
    wire eret, unknown_opcode;
    wire [3:0] ALUop;
    wire jr, shamt;
    wire [WSIZE-1:0] exception_ADDR;
    wire exception;
    wire [3:0] opcode;
    wire [WSIZE-1:0] A, B, R;
    wire Z, O;
    wire selector;
    wire [WSIZE-1:0] input1, input2, input3, input4, output;
    wire [3:0] nibble;
    wire [0:6] display_code;
    wire [31:0] input, output;
    wire [7:0] address;
    wire wren;
    wire [31:0] data, q;

    // Lógica do processador
    // (A ser implementada na próxima parte)

    // Sinais de controle
    wire branch, branchN, eret, exception, jump;
    wire sel_JR, sel_shamt;
    wire [1:0] sel_BREG_WD, sel_BREG_WR;
    wire sel_ULA_opB;
    wire ULA_overflow, ULA_zero;
    wire unknown_opcode;
    wire write_BREG, write_DATA_MEM;

    wire [TYPES_SIZE-1:0] instruction_type;

    // Sinais de dados
    wire [BREG_SIZE-1:0] BREG_R1, BREG_R2, BREG_WR;

    wire [WSIZE-1:0] branch_ADDR;
    wire [WSIZE-1:0] BREG_D1, BREG_D2, BREG_WD;
    wire [WSIZE-1:0] DATA_MEM_output;
    wire [WSIZE-1:0] EPC_output, exception_ADDR;
    wire [WSIZE-1:0] instruction;
    wire [WSIZE-1:0] jump_ADDR;
    wire [0:55] nibble_codes1, nibble_codes2;
    wire [WSIZE-1:0] old_PC, old_PC_plus_4;
    wire [WSIZE-1:0] PC_input, PC_output;
    wire [WSIZE-1:0] PC_plus_4, next_PC;
    wire [WSIZE-1:0] sxt_imm, sxt_keys;
    wire [WSIZE-1:0] ULA_opA, ULA_opB, ULA_result;

    wire [0:55] BREG_D1_nibble_codes, BREG_D2_nibble_codes;
    wire [0:55] BREG_WD_nibble_codes, BREG_WR_nibble_codes;
    wire [0:55] data_mem_nibble_codes, inst_nibble_codes;
    wire [0:55] PC_nibble_codes, ULA_nibble_codes;

    // Atribuição de sinais
    assign BREG_R1 = instruction[25:21];
    assign BREG_R2 = instruction[20:16];
    assign jump_ADDR = {PC_plus_4[WSIZE-1:WSIZE-4], instruction[25:0], 2'b00};
    assign sxt_imm = $signed(instruction[15:0]);
    assign sxt_keys = {keys, 2'b00};
    assign overflow = ULA_overflow;
    assign unknown_op = unknown_opcode;

    // Banco de registradores (BREG)
    MIPS_BREG #(
        .WSIZE(WSIZE)
    ) BREG (
        .clock(~clock),
        .readADDR1(BREG_R1),
        .readADDR2(BREG_R2),
        .Reg1(BREG_D1),
        .Reg2(BREG_D2),
        .reset(~reset),
        .writeADDR(BREG_WR),
        .write_data(BREG_WD),
        .write_enable(write_BREG)
    );

    // Controlador (MIPS_Controller)
    MIPS_Controller Controller (
        .ALUop(instruction_type),
        .ALUsrc(sel_ULA_opB),
        .branch(branch),
        .branchN(branchN),
        .eret(eret),
        .inst_functor(instruction[5:0]),
        .inst_opcode(instruction[31:26]),
        .jump(jump),
        .memToReg(sel_BREG_WD),
        .memWrite(write_DATA_MEM),
        .regDST(sel_BREG_WR),
        .regWrite(write_BREG),
        .unknown_opcode(unknown_opcode),
        .jr(sel_JR),
        .shamt(sel_shamt)
    );

    // Controlador de exceção (MIPS_Exception_Controller)
    MIPS_Exception_Controller #(
        .WSIZE(WSIZE)
    ) Exception_Controller (
        .exception_ADDR(exception_ADDR),
        .exception(exception),
        .overflow(ULA_overflow),
        .unknown_opcode(unknown_opcode)
    );

    // Memória de dados (Data_RAM)
    RAM #(
        .MIF_FILE(MIF_FILE_DATA)
    ) Data_RAM (
        .address(ULA_result[9:2]),
        .clock(clock),
        .data(BREG_D2),
        .wren(write_DATA_MEM),
        .q(DATA_MEM_output)
    );

    // Memória de instruções (Instruction_RAM)
    RAM #(
        .MIF_FILE(MIF_FILE_INSTRUCTION)
    ) Instruction_RAM (
        .address(PC_output[9:2]),
        .clock(~clock),
        .data(32'b0),
        .wren(1'b0),
        .q(instruction)
    );

    // Lógica adicional do processador
    // Multiplexadores

    // Mux_BREG_WD
    Multiplexer4to1 #(
        .WSIZE(WSIZE)
    ) Mux_BREG_WD (
        .input1(ULA_result),
        .input2(DATA_MEM_output),
        .input3(sxt_imm << 16), // Shift left de 16 bits
        .input4(old_PC_plus_4),
        .selector(sel_BREG_WD),
        .output(BREG_WD)
    );

    // Mux_BREG_WR
    Multiplexer4to1 #(
        .WSIZE(BREG_SIZE)
    ) Mux_BREG_WR (
        .input1(instruction[20:16]),
        .input2(instruction[15:11]),
        .input3(5'b00000),
        .input4(5'b11111),
        .selector(sel_BREG_WR),
        .output(BREG_WR)
    );

    // Mux_nibble_codes
    Multiplexer2to1 #(
        .WSIZE(56)
    ) Mux_nibble_codes (
        .input1(nibble_codes1),
        .input2(nibble_codes2),
        .selector(nibble_view[2]),
        .output(nibble_codes)
    );

    // Mux_nibble_codes1
    Multiplexer4to1 #(
        .WSIZE(56)
    ) Mux_nibble_codes1 (
        .input1(PC_nibble_codes),
        .input2(inst_nibble_codes),
        .input3(ULA_nibble_codes),
        .input4(data_mem_nibble_codes),
        .selector(nibble_view[1:0]),
        .output(nibble_codes1)
    );

    // Mux_nibble_codes2
    Multiplexer4to1 #(
        .WSIZE(56)
    ) Mux_nibble_codes2 (
        .input1(BREG_D1_nibble_codes),
        .input2(BREG_D2_nibble_codes),
        .input3(BREG_WD_nibble_codes),
        .input4(BREG_WR_nibble_codes),
        .selector(nibble_view[1:0]),
        .output(nibble_codes2)
    );

    // Mux_next_PC
    Multiplexer4to1 #(
        .WSIZE(WSIZE)
    ) Mux_next_PC (
        .input1(PC_plus_4),
        .input2(branch_ADDR),
        .input3(jump_ADDR),
        .input4(BREG_D1),
        .selector({(jump | sel_JR), ((branchN & ~ULA_zero) | (branch & ULA_zero) | sel_JR)}),
        .output(next_PC)
    );

    // Mux_PC_input
    Multiplexer4to1 #(
        .WSIZE(WSIZE)
    ) Mux_PC_input (
        .input1(next_PC),
        .input2(exception_ADDR),
        .input3(EPC_output),
        .input4(sxt_keys),
        .selector({(keys_input | eret), (keys_input | exception)}),
        .output(PC_input)
    );

    // Mux_ULA_opA
    Multiplexer2to1 #(
        .WSIZE(WSIZE)
    ) Mux_ULA_opA (
        .input1(BREG_D1),
        .input2({27'b0, instruction[10:6]}), // Extensão de 5 bits para 32 bits
        .selector(sel_shamt),
        .output(ULA_opA)
    );

    // Mux_ULA_opB
    Multiplexer2to1 #(
        .WSIZE(WSIZE)
    ) Mux_ULA_opB (
        .input1(BREG_D2),
        .input2(sxt_imm),
        .selector(sel_ULA_opB),
        .output(ULA_opB)
    );

    // Conversores de nibble

    NibbleDisplayConverter NDC_BREG_D1 (
        .input(BREG_D1),
        .output(BREG_D1_nibble_codes)
    );

    NibbleDisplayConverter NDC_BREG_D2 (
        .input(BREG_D2),
        .output(BREG_D2_nibble_codes)
    );

    NibbleDisplayConverter NDC_BREG_WD (
        .input(BREG_WD),
        .output(BREG_WD_nibble_codes)
    );

    NibbleDisplayConverter NDC_BREG_WR (
        .input({27'b0, BREG_WR}), // Extensão de 5 bits para 32 bits
        .output(BREG_WR_nibble_codes)
    );

    NibbleDisplayConverter NDC_Data_Mem (
        .input(DATA_MEM_output),
        .output(data_mem_nibble_codes)
    );

    NibbleDisplayConverter NDC_inst (
        .input(instruction),
        .output(inst_nibble_codes)
    );

    NibbleDisplayConverter NDC_PC (
        .input(PC_output),
        .output(PC_nibble_codes)
    );

    NibbleDisplayConverter NDC_ULA (
        .input(ULA_result),
        .output(ULA_nibble_codes)
    );

    // Contadores de programa

    ProgramCounter #(
        .WSIZE(WSIZE)
    ) EPC (
        .clock(~clock),
        .data(PC_plus_4),
        .output(EPC_output),
        .reset(~reset),
        .write_enable(exception)
    );

    ProgramCounter #(
        .WSIZE(WSIZE)
    ) PC (
        .clock(~clock),
        .data(PC_input),
        .output(PC_output),
        .reset(~reset),
        .write_enable(run)
    );

    ProgramCounter #(
        .WSIZE(WSIZE)
    ) OldPC (
        .clock(clock),
        .data(PC_output),
        .output(old_PC),
        .reset(~reset),
        .write_enable(run)
    );

    // ULA (Unidade Lógica e Aritmética)

    MIPS_ULA #(
        .WSIZE(WSIZE)
    ) ULA (
        .opcode(instruction_type),
        .A(ULA_opA),
        .B(ULA_opB),
        .O(ULA_overflow),
        .R(ULA_result),
        .Z(ULA_zero)
    );

    // Somadores não assinados

    UnsignedAdder #(
        .WSIZE(WSIZE)
    ) UA_branch_ADDR (
        .input1(PC_plus_4),
        .input2({sxt_imm[WSIZE-3:0], 2'b00}), // Shift left de 2 bits
        .output(branch_ADDR)
    );

    UnsignedAdder #(
        .WSIZE(WSIZE)
    ) UA_old_PC_plus_4 (
        .input1(32'd4),
        .input2(old_PC),
        .output(old_PC_plus_4)
    );

    UnsignedAdder #(
        .WSIZE(WSIZE)
    ) UA_PC_plus_4 (
        .input1(32'd4),
        .input2(PC_output),
        .output(PC_plus_4)
    );

endmodule

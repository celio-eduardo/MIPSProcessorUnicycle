module JumpEndereco(
    input [25:0] endereco,  // IR J
    input [31:0] pc_pp,      // PC + 4
    output [31:0] jump_endereco
);

    assign jump_endereco = {pc_pp[31:28], endereco, 2'b00};

endmodule
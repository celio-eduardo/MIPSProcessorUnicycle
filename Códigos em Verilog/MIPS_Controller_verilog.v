module MIPS_Controller (
    input wire [5:0] inst_opcode,
    input wire [5:0] inst_functor,
    output reg jump,
    output reg branch,
    output reg branchN,
    output reg memWrite,
    output reg ALUsrc,
    output reg regWrite,
    output reg [1:0] regDST,
    output reg [1:0] memToReg,
    output reg eret,
    output reg unknown_opcode,
    output reg [3:0] ALUop,
    output reg jr,
    output reg shamt
);

    always @(*) begin
        // Valores padrão
        jump = 0;
        branch = 0;
        branchN = 0;
        memWrite = 0;
        ALUsrc = 0;
        regWrite = 0;
        regDST = 2'b00;
        memToReg = 2'b00;
        eret = 0;
        unknown_opcode = 0;
        ALUop = 4'b1111;
        jr = 0;
        shamt = 0;

        case (inst_opcode)
            6'b000000: begin // Tipo R
                regDST = 2'b01;
                case (inst_functor)
                    6'b100100: begin // AND
                        ALUop = 4'b0000;
                        regWrite = 1;
                    end
                    6'b100101: begin // OR
                        ALUop = 4'b0001;
                        regWrite = 1;
                    end
                    6'b100000: begin // ADD
                        ALUop = 4'b0010;
                        regWrite = 1;
                    end
                    6'b100001: begin // ADDU
                        ALUop = 4'b0011;
                        regWrite = 1;
                    end
                    6'b001000: begin // JR
                        ALUop = 4'b0000;
                        regWrite = 1;
                        jr = 1;
                    end
                    6'b100010: begin // SUB
                        ALUop = 4'b0100;
                        regWrite = 1;
                    end
                    6'b100011: begin // SUBU
                        ALUop = 4'b0101;
                        regWrite = 1;
                    end
                    6'b101010: begin // SLT
                        ALUop = 4'b0110;
                        regWrite = 1;
                    end
                    6'b101011: begin // SLTU
                        ALUop = 4'b0111;
                        regWrite = 1;
                    end
                    6'b100111: begin // NOR
                        ALUop = 4'b1000;
                        regWrite = 1;
                    end
                    6'b100110: begin // XOR
                        ALUop = 4'b1001;
                        regWrite = 1;
                    end
                    6'b000000: begin // SLL
                        ALUop = 4'b1010;
                        regWrite = 1;
                        shamt = 1;
                    end
                    6'b000010: begin // SRL
                        ALUop = 4'b1011;
                        regWrite = 1;
                        shamt = 1;
                    end
                    6'b000011: begin // SRA
                        ALUop = 4'b1100;
                        regWrite = 1;
                        shamt = 1;
                    end
                    default: begin // Funct inválido
                        unknown_opcode = 1;
                        regWrite = 0;
                    end
                endcase
            end

            6'b001000: begin // ADDI
                regDST = 2'b00;
                ALUsrc = 1;
                regWrite = 1;
                ALUop = 4'b0010;
            end

            6'b001001: begin // ADDIU
                regDST = 2'b00;
                ALUsrc = 1;
                regWrite = 1;
                ALUop = 4'b0011;
            end

            6'b000010: begin // J
                jump = 1;
            end

            6'b000011: begin // JAL
                regDST = 2'b11;
                jump = 1;
                memToReg = 2'b11;
                regWrite = 1;
            end

            6'b001010: begin // SLTI
                regDST = 2'b00;
                ALUsrc = 1;
                regWrite = 1;
                ALUop = 4'b0110;
            end

            6'b001100: begin // ANDI
                regDST = 2'b00;
                ALUsrc = 1;
                regWrite = 1;
                ALUop = 4'b0000;
            end

            6'b001101: begin // ORI
                regDST = 2'b00;
                ALUsrc = 1;
                regWrite = 1;
                ALUop = 4'b0001;
            end

            6'b001110: begin // XORI
                regDST = 2'b00;
                ALUsrc = 1;
                regWrite = 1;
                ALUop = 4'b1001;
            end

            6'b000100: begin // BEQ
                branch = 1;
                ALUop = 4'b0100;
            end

            6'b000101: begin // BNE
                branchN = 1;
                ALUop = 4'b0100;
            end

            6'b001111: begin // LUI
                memToReg = 2'b10;
                regWrite = 1;
                ALUop = 4'b0010;
            end

            6'b100011: begin // LW
                memToReg = 2'b01;
                ALUsrc = 1;
                regWrite = 1;
                ALUop = 4'b0010;
            end

            6'b101011: begin // SW
                memWrite = 1;
                ALUsrc = 1;
                ALUop = 4'b0010;
            end

            6'b010000: begin // Coprocessor 0
                case (inst_functor)
                    6'b011000: begin // ERET
                        eret = 1;
                    end
                    default: begin // Unknown opcode
                        unknown_opcode = 1;
                    end
                endcase
            end

            default: begin // Unknown opcode
                unknown_opcode = 1;
            end
        endcase
    end

endmodule

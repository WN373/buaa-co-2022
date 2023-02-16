// other macros



// instruction split

`define _opt 31:26
`define _rs 25:21
`define _base 25:21
`define _rt 20:16
`define _rd 15:11
`define _shamt 10:6
`define _funct 5:0
`define _imm16 15:0
`define _imm26 25:0

// instruction decode

//      R-type

`define R   6'b0

// funct code
`define ADD     6'b100000
`define ADDU    6'b100001
`define SUB		6'b100010
`define SUBU    6'b100011

`define AND		6'b100100
`define OR		6'b100101
`define XOR		6'b100110
`define NOR		6'b100111

`define SLT		6'b101010
`define SLTU	6'b101011

`define SLL		6'b000000
`define SRL		6'b000010
`define SRA		6'b000011
`define SLLV	6'b000100
`define SRLV	6'b000110
`define SRAV	6'b000111

`define MULT    6'b011000
`define MULTU   6'b011001
`define DIV     6'b011010
`define DIVU    6'b011011

`define MFHI    6'b010000
`define MFLO    6'b010010
`define MTHI    6'b010001
`define MTLO    6'b010011
// end code

//      I-type
// opt code

// calc
`define LUI     6'b001111

`define ORI     6'b001101
`define ADDI	6'b001000
`define ADDIU	6'b001001
`define ANDI	6'b001100
`define XORI	6'b001110

`define SLTI	6'b001010
`define SLTIU	6'b001011

// mem

`define LB      6'b100000
`define SB      6'b101000
`define LH      6'b100001
`define SH      6'b101001
`define LW      6'b100011
`define SW      6'b101011
`define LBU     6'b100100
`define LHU     6'b100101

// branch

`define BEQ		6'b000100
`define BNE		6'b000101
`define BGEZ    6'b000001
`define BLEZ	6'b000110
`define BGTZ	6'b000111
`define BLTZ	6'b000001

//      Jump
// j

`define J       6'b000010
`define JAL     6'b000011

//  jr
// func code

`define JR      6'b001000
`define JALR    6'b001001

// ========== ========== ========== ==========
// ========== ===== Controller ==== ==========
// ========== ========== ========== ==========

// ========== MLU ============================

`define MLU_mult    5'd0
`define MLU_multu   5'd1
`define MLU_div     5'd2
`define MLU_divu    5'd3
`define MLU_mthi    5'd4
`define MLU_mtlo    5'd5
`define MLU_fdiv    5'd6

//  =========== ALU ==========================
`define ALU_add     5'd0
`define ALU_sub     5'd1
`define ALU_or      5'd2
`define ALU_sll     5'd3
`define ALU_and     5'd4
`define ALU_slt     5'd5
`define ALU_sltu    5'd6
`define ALU_xor		5'd7
`define ALU_nor		5'd8
`define ALU_srl		5'd9
`define ALU_sra		5'd10


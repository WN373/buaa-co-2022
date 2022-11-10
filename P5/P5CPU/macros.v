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

`define SUB		6'b100010

`define SLL     6'b000000

//      I-type
// opt code

// calc
`define LUI     6'b001111

`define ORI     6'b001101

// mem

`define LW      6'b100011
`define SW      6'b101011

// branch

`define BEQ     6'b000100

//      Jump

// j

`define J       6'b000010
`define JAL     6'b000011

//  jr

`define JR      6'b001000
module alu(
    input wire [63:0] a,
    input wire [63:0] b,
    input wire [4:0] op_code,
    output reg [63:0] result,
    output reg carry_out
);

// ALU operations

// Logical operations

localparam AND = 5'b00000;
localparam OR = 5'b00001;
localparam XOR = 5'b00010;
localparam NOT = 5'b00011;
localparam NAND = 5'b00100;
localparam NOR = 5'b00101;
localparam XNOR = 5'b00110;
localparam SHL = 5'b00111; // TODO Shift left
localparam SHR = 5'b01000; // TODO Shift right

// Arithmetic operations

localparam ADD = 5'b01001;
localparam SUB = 5'b01010;
localparam MUL = 5'b01011; // TODO Multiplication
localparam DIV = 5'b01100; // TODO Division
localparam MOD = 5'b01101; // TODO Modulus
localparam INC = 5'b01110; // TODO Increment
localparam DEC = 5'b01111; // TODO Decrement
localparam NEG = 5'b10000; // TODO Negate
localparam ABS = 5'b10001; // TODO Absolute value
localparam SQRT = 5'b10010; // TODO Square root
localparam POW = 5'b10011; // TODO Power

case (op_code)

    AND: result = a & b;
    OR: result = a | b;
    XOR: result = a ^ b;
    NOT: result = ~a;
    NAND: result = ~(a & b);
    NOR: result = ~(a | b);
    XNOR: result = ~(a ^ b);
    SHL: result = a << b;
    SHR: result = a >> b;

    ADD: result = a + b;
    SUB: result = a - b;
    MUL: result = a * b;
    DIV: result = a / b;
    MOD: result = a % b;
    INC: result = a + 1;
    DEC: result = a - 1;
    NEG: result = -1 * a;
    ABS: result = (a < 0) ? (-1 * a) : a;
    SQRT: result = $sqrt(a);
    POW: result = $pow(a, b);

    default: result = 64'b0;

endcase

endmodule
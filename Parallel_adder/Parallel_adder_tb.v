`timescale 1ns/1ps

module parallel_adder_tb();

reg [3:0] t_a;
reg [3:0] t_b;
reg t_cin;

wire [3:0] t_sum;
wire t_cout;

// Instantiate the parallel adder
Parallel_adder gut(
    .A(t_a),
    .B(t_b),
    .Cin(t_cin),
    .Sum(t_sum),
    .Cout(t_cout)
);

initial begin
    $dumpfile("parallel_adder.vcd");
    $dumpvars(0,parallel_adder_tb);
    $display("A | B | Cin | Sum | Carry");
    $monitor("%b | %b | %b | %b | %b", t_a, t_b, t_cin, t_sum, t_cout);

    // Test cases
    t_a = 4'b0000; t_b = 4'b0000; t_cin = 0; #10;
    t_a = 4'b0011; t_b = 4'b0101; t_cin = 0; #10;
    t_a = 4'b1111; t_b = 4'b0001; t_cin = 0; #10;
    t_a = 4'b1010; t_b = 4'b0101; t_cin = 1; #10;

    $finish;

end

endmodule
/**********************************************************
@SoC team, mducng
FIR with 4 tapes
h0 = h1 = h2 = h3 --> Average filter
***********************************************************/
module myFIRavg(
	input                    clk,
	input      signed [15:0] din,
	output reg signed [23:0] dout
);
//Internal variables.
    wire signed [15:0] h3,h2,h1,h0;
    wire signed [31:0] mul_out0,mul_out1,mul_out2,mul_out3;    
    wire signed [31:0] add_out1,add_out2,add_out3;
    reg  signed [31:0] q1,q2,q3;  
//filter coefficient initializations.
//h     = [1/4 1/4 1/4 1/4];
//h*2^8 = [64 64 64 64];
    assign h3         = 64;
    assign h2         = 64;
    assign h1         = 64;
    assign h0         = 64;
//Multiple constant multiplications.
    assign   mul_out3 = h3*din;
    assign   mul_out2 = h2*din;
    assign   mul_out1 = h1*din;
    assign   mul_out0 = h0*din;
//adders
    assign add_out1   = q1 + mul_out2;
    assign add_out2   = q2 + mul_out1;
    assign add_out3   = q3 + mul_out0;    
//Assign delay.
    always@ (posedge clk) begin
 		q1           <= mul_out3;
		q2           <= add_out1;
     	q3           <= add_out2;
	 end
//Assign the last adder output to final output.
    always@ (posedge clk) begin
		dout         <= add_out3[31:8];
	 end
endmodule

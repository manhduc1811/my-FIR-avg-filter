/**********************************************************
@SoC team, mducng
FIR with 4 tapes
h0 = 0.7, h1 = 0.15, h2 = 0.1, h3 = 0.05 
FIR averaging filter for MPP1.51
***********************************************************/
module myFIRmpp(
	input                    clk,
	input      signed [15:0] din,
	output reg signed [23:0] dout
);
//Internal variables.
    wire signed [15:0] h0,h1,h2,h3;
    wire signed [31:0] mul_out0,mul_out1,mul_out2,mul_out3;    
    wire signed [31:0] add_out0,add_out1,add_out2;
    reg  signed [31:0] q0,q1,q2;  
//filter coefficient initializations.
//h     = [0.7 0.15 0.1 0.05];
//h*2^8 = [179 38 25 12];
    assign h3         = 12;
    assign h2         = 25;
    assign h1         = 38;
    assign h0         = 179;
//Multiple constant multiplications.
//scale up *4 (MPP spec)
    assign   mul_out3 = h3*din*4;
    assign   mul_out2 = h2*din*4;
    assign   mul_out1 = h1*din*4;
    assign   mul_out0 = h0*din*4;
//adders
    assign add_out2   = q2 + mul_out2;
    assign add_out1   = q1 + mul_out1;
    assign add_out0   = q0 + mul_out0;    
//Assign delay.
    always@ (posedge clk) begin
 		q2           <= mul_out3;
		q1           <= add_out2;
     	q0           <= add_out1;
	 end
//Assign the last adder output to final output.
    always@ (posedge clk) begin
		dout         <= add_out0[31:8];
	 end
endmodule

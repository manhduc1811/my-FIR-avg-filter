/************************************************************************************************
@SoC team, mducng
************************************************************************************************/
module myFIRavg_tb;
    // Inputs
    reg                clk;
    reg  signed [15:0] din;
    // Outputs
    wire signed [23:0] dout;
    // UUT
    myFIRavg uut (
        .clk(clk), 
        .din(din), 
        .dout(dout)
    ); 
    // Generate a clock with 10 ns clock period.
    initial clk   = 0;
    always #5 
		clk = ~clk;
	// Initialize and apply the inputs.
    initial begin
	   din = 0; #10; // Sample(1)
	   din = 0; #10; // Sample(2)
	   din = 0; #10; // Sample(3)
	   din = 0; #10; // Sample(4)
	   din = 0; #10; // Sample(5)
	   din = -65; #10; // Sample(6)
	   din = -105; #10; // Sample(7)
	   din = -83; #10; // Sample(8)
	   din = -81; #10; // Sample(9)
	   din = -52; #10; // Sample(10)
	   din = 33; #10; // Sample(11)
	   din = 68; #10; // Sample(12)
	   din = 3; #10; // Sample(13)
	   din = 47; #10; // Sample(14)
	   din = -49; #10; // Sample(15)
	   din = -53; #10; // Sample(16)
	   din = -30; #10; // Sample(17)
	   din = -49; #10; // Sample(18)
	   din = -22; #10; // Sample(19)
	   din = -13; #10; // Sample(20)
	   din = -69; #10; // Sample(21)
	   din = 107; #10; // Sample(22)
	   din = 82; #10; // Sample(23)
	   din = 116; #10; // Sample(24)
	   din = 84; #10; // Sample(25)
	   din = -68; #10; // Sample(26)
	   din = 26; #10; // Sample(27)
	   din = 10; #10; // Sample(28)
	   din = 72; #10; // Sample(29)
	   din = 97; #10; // Sample(30)
	   din = -34; #10; // Sample(31)
	   din = 81; #10; // Sample(32)
	   din = 54; #10; // Sample(33)
	   din = 50; #10; // Sample(34)
	   din = -67; #10; // Sample(35)
	   din = -93; #10; // Sample(36)
	   din = -52; #10; // Sample(37)
	   din = -96; #10; // Sample(38)
	   din = -29; #10; // Sample(39)
	   din = 119; #10; // Sample(40)
	   din = -70; #10; // Sample(41)
	   din = -56; #10; // Sample(42)
	   din = 58; #10; // Sample(43)
	   din = -91; #10; // Sample(44)
	   din = 88; #10; // Sample(45)
	   din = 68; #10; // Sample(46)
	   din = 0; #10; // Sample(47)
	   din = 0; #10; // Sample(48)
	   din = 0; #10; // Sample(49)
	   din = 0; #10; // Sample(50)
	   din = 0; #10; // Sample(51)
	   din = 0; #10; // Sample(52)
	   din = 0; #10; // Sample(53)
	   din = 0; #10; // Sample(54)
	   din = 0; #10; // Sample(55)
	   din = 0; #10; // Sample(56)
	   #40;
	   $stop;	
    end
endmodule

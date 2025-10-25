`define S0 3'b000
`define S1 3'b001
`define S2 3'b010
`define S3 3'b011
`define S4 3'b100

class trans;
	rand bit [2:0]sel;
	covergroup cg;
		coverpoint sel{
		bins a[]=(`S0=>`S1),(`S1=>`S2),(`S2=>`S3),(`S3=>`S4),(`S0=>`S1=>`S2);
		bins other=default;
		}
	endgroup
function new();
	cg=new();
endfunction
endclass
module tb;
	trans t;
	initial begin
	t=new();
	repeat(50)begin
	t.randomize() with {t.sel<=4;};
	t.cg.sample();
	end
	end
endmodule

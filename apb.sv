`define WIDTH 8
`define DEPTH 16
`define ADDR_WIDTH $clog2(`DEPTH)
`define SEL 4
class apb_tx;
	rand bit pwrite;
	rand bit [`ADDR_WIDTH-1:0] paddr;
	rand bit [`WIDTH-1:0] pwdata;
	bit [`WIDTH-1:0] prdata;
	rand bit [`SEL-1:0] psel;
	bit perr;
	function void print();
		$display("pwrite=%0b",pwrite);
		$display("paddr=%0b",paddr);
		$display("pwdata=%0b",pwdata);
		$display("prdata=%0b",prdata);
		$display("psel=%0b",psel);
		$display("perr=%0b",perr);
	endfunction

constraint apb{
//psel inside {4'b0000,4'b0001,4'b0010,4'b0100,4'b1000};
 $onehot0(psel);
}

endclass

module tb;
apb_tx tx;
initial begin
	tx=new();
	tx.randomize();
	tx.print();
end
endmodule

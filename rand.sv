class sample;
rand bit[3:0] a;
randc bit[3:0] b;
function void print();
	$display("a=%0d,b=%0d",a,b);
endfunction
endclass

module tb;
sample s;
	initial begin
	s=new();
	repeat(10) begin
	s.randomize();
	s.print();
	end
	end
endmodule

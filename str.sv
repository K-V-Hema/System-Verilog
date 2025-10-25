module tb;
string str;
initial begin
	//str="vlsi";
	$value$plusargs("str=%0s",str);
	$display("str=%0s",str);
end
endmodule

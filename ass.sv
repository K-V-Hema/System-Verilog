module tb;
int ass[string];
string str;
int value;
initial begin
	repeat(10) begin
	value=$urandom_range(65,92);
	$sformat(str,"%0s",value);
	ass[str]=$urandom_range(100,200);
	end
$display("ass=%p",ass);
end
endmodule

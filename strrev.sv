module tb;
string str,str1;
initial begin
	str="vlsiguru";
	str1=str;
for(int i=0;i<str.len();i++) begin
	str1.putc(i,str[str.len ()-1-i]);
end
$display("str=%0s",str);
$display("str1=%0s",str1);
end
endmodule

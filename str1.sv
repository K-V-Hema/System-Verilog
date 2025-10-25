module tb;
string str1,str2,str,str3;
int n;
byte p;
initial begin
	str="VLsI_GURU";
	n=str.len();
	$display("n=%0d",n);

	str.putc(2,"N");
	$display("str=%0s",str);

	p=str.getc(5);
	$display("p=%0s",p);
	
	str1=str.tolower();
	$display("str1=%0s",str1);

	str2=str.toupper();
	$display("str2=%0s",str2);
	
	if(str1.compare(str2)==0)
	$display("both are same");
	else
	$display("both are not same");

	str3=str.substr(2,6);
	$display("str3=%0s",str3);
end
endmodule

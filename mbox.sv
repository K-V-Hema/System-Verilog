module tb;
	mailbox mbox1=new();
	mailbox #(int)mbox2=new();
	int a;
	real b;
	string s;
initial begin
	a=100;
	b=5.248;
	s="vlsiguru";
	mbox1.put(a);
	mbox1.put(b);
	mbox1.put(s);
	$display("mbox1=%p",mbox1);
	mbox2.put(a);
	mbox2.put(b);
//	mbox2.put(s);
	$display("mbox2=%p",mbox2);
end
endmodule

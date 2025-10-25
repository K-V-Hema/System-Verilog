module tb;
mailbox mbox=new();
int value,n;
initial begin
	for(int i=0;i<10;i++) begin
		value=$urandom_range(10,30);
		mbox.put(value);
		$display("mbox=%p",mbox);
	end
n=mbox.num();
$display("n=%0d",n);

	for(int i=0;i<10;i++) begin
	mbox.get(value);
		$display("mbox=%p",mbox);
	end

	for(int i=0;i<10;i++) begin
	value=$urandom_range(50,60);
	mbox.try_put(value);
		$display("mbox=%p",mbox);
	end

		mbox.peek(value);
		$display("value=%0d",value);
end
endmodule



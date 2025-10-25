class parent;
	local int a;
	protected int b;
	int c;
	function void set(input int p,q);
		a=p;
		b=q;
	endfunction
	function void print();
		$display("a=%0d",a);
		$display("b=%0d",b);
		$display("c=%0d",c);
	endfunction
endclass 
class child extends parent;
	function new();
	b=150;
	c=250;
	endfunction
endclass
module tb;
parent p;
initial begin
	p=new();
	p.set(5,10);
	p.c=300;
	p.print();
end
endmodule

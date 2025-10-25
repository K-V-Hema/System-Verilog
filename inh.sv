class parent;
int a;
int b;
function void print();
	$display("a=%0d,b=%0d",a,b);
endfunction
endclass
class child extends parent;
int c,d;
	function void print();
		super.print();
		$display("c=%0d,d=%0d",c,d);
	endfunction
endclass

module tb;
	parent p;
	child ch;
	initial begin
		p=new();
		p.a=10;
		p.b=2;
		ch=new();
		ch.a=3;
		ch.b=4;
		ch.c=44;
		ch.d=7;
		ch.print();
		p.print();
	end
endmodule

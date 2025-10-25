class parent;
rand int a;
virtual function void print();
	$display("a=%0d",a);
endfunction
constraint a_c{
	a>10;
	a<20;
}
endclass
class child extends parent;
rand int b;
function void print();
	super.print();
	$display("b=%0d",b);
endfunction
constraint b_c{
	b>20;
}
endclass
module tb;
parent p;
child ch;
initial begin
	ch=new();
	ch.randomize();
	ch.print;
//	p=ch;
	$cast(p,ch);
	p.print();
end
endmodule


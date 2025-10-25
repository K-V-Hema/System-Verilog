class apb_tx;
	rand bit [3:0]ssel;
endclass
apb_tx tx=new();

covergroup CG;
	coverpoint tx.ssel{
		bins SEL0={4'b0000};
		bins SEL1={4'b0001};
		bins SEL2={4'b0010};
		bins SEL3={4'b0100};
		bins SEL4={4'b1000};
		bins OTHER=default;
	}
endgroup
class apb_coverage1;
	apb_tx tx1;
	CG cg1;
	function new();
		cg1=new();
	endfunction
task run();
	tx1=new();
	repeat(50) begin
	tx1.randomize();
	$unit::tx=tx1;
	cg1.sample();
	end
endtask
endclass
class apb_coverage2;
	apb_tx tx2;
	CG cg2;
	function new();
		cg2=new();
	endfunction
task run();
	tx2=new();
	repeat(50) begin
	tx2.randomize();
	$unit::tx=tx2;
	cg2.sample();
	end
endtask
endclass
class apb_coverage3;
	apb_tx tx3;
	CG cg3;
	function new();
		cg3=new();
	endfunction
task run();
	tx3=new();
	repeat(50) begin
	tx3.randomize();
	$unit::tx=tx3;
	cg3.sample();
	end
endtask
endclass
module tb;
	apb_coverage1 cov1;
	apb_coverage2 cov2;
	apb_coverage3 cov3;
	initial begin
		cov1=new();
		cov2=new();
		cov3=new();
		cov1.run();
		cov2.run();
		cov3.run();
	end
endmodule

class eth_pkt;
	rand bit [55:0]preamble;
	rand bit[7:0]sof;
	rand bit[47:0]sa;
	rand bit[47:0]da;
	rand bit [15:0]len;
	rand bit[31:0]crc;
	rand byte payload[$];
	function void print();
		$display("preamble=%0d",preamble);
		$display("sof=%0d",sof);
		$display("sa=%0d",sa);
		$display("da=%0d",da);
		$display("len=%0d",len);
		$display("crc=%0d",crc);
		$display("payload=%p",payload);
	endfunction

constraint cc{
		len inside {[42:1500]};
		payload.size()==len;
		}
endclass

module tb;
eth_pkt pkt;
	initial begin
		pkt=new();
		pkt.randomize();
		pkt.print();
	end
endmodule


class eth_pkt;
	rand bit[55:0]preamble;
	rand bit[7:0]sof;
	rand bit [47:0]sa;
	rand bit [47:0]da;
	rand bit [15:0]len;
		 bit [31:0]crc;
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

//copy method
	function void copy(input eth_pkt i_pkt,output eth_pkt o_pkt);
		o_pkt=new();
		o_pkt.preamble=i_pkt.preamble;
		o_pkt.sof=i_pkt.sof;
		o_pkt.sa=i_pkt.sa;
		o_pkt.da=i_pkt.da;
		o_pkt.len=i_pkt.len;
		o_pkt.crc=i_pkt.crc;
		o_pkt.payload=i_pkt.payload;
	endfunction

//compare method
	function bit compare(input eth_pkt i_pkt,o_pkt);
		if(	o_pkt.preamble==i_pkt.preamble&&
		o_pkt.sof==i_pkt.sof&&
		o_pkt.sa==i_pkt.sa&&
		o_pkt.da==i_pkt.da&&
		o_pkt.len==i_pkt.len&&
		o_pkt.crc==i_pkt.crc&&
		o_pkt.payload==i_pkt.payload)
			return 1;
	endfunction

//pack method
	function void pack(input eth_pkt i_pkt,output byte byteq[$]);
		byteq={>>{i_pkt.preamble,i_pkt.sof,i_pkt.sa,i_pkt.da,i_pkt.len,i_pkt.crc,i_pkt.payload}};	
	endfunction

//unpack method
	function void unpack(input byte byteq[$],output eth_pkt i_pkt);
	i_pkt=new();
		{>>{i_pkt.preamble,i_pkt.sof,i_pkt.sa,i_pkt.da,i_pkt.len,i_pkt.crc,i_pkt.payload}}=i_pkt;	endfunction

endclass

module tb;
eth_pkt pkt,pkt1,pkt3;
byte queue[$];
initial begin
	pkt=new();
	pkt.randomize();
	$display("pkt1");
	pkt.print();
	pkt1.copy(pkt,pkt1);
	$display("pkt2");
	pkt1.print();
	$display("------------------------------------");
	if(pkt1.compare(pkt,pkt1))
	$display("same");
	else
	$display("not same");
	$display("------------------------------------");
	pkt.pack(pkt,queue);
	$display("pkt=%p",queue);
	$display("------------------------------------");
	pkt.unpack(queue,pkt3);
	pkt3.print();
end
endmodule





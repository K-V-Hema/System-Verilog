module tb;
	reg clk;
	real tp,jitter,jitter_tp;
	initial begin
		clk=0;
		tp=10;
		jitter=3;
		forever begin
			jitter_tp=($urandom_range(100-jitter,100+jitter)/100.0)*tp;
			#(jitter_tp/2) clk=~clk; 
		end
	end
		initial begin
			#200;
			$finish;
		end
	property jitter_check;
		real prev_time,tp,j;
		@(posedge clk) (1,prev_time=$realtime,tp=10,j=3) |=> ($realtime-prev_time inside {[((100-j)/100.0)*tp:((100+j)/100.0)*tp]});
	endproperty
	assert property(jitter_check);
endmodule

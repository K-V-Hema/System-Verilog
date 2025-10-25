module tb;
	initial begin
		$display("%0t:entry-1",$time);
		#3;
	fork
		fork
		$display("%0t:entry-2",$time);
		#3;
		$display("%0t:entry-3",$time);
		begin
		#10;
		$display("%0t:entry-4",$time);
		#1;
		end
		$display("%0t:entry-5",$time);
		join
		begin
		fork
		$display("%0t:entry-6",$time);
		#2;
		#3 $display("%0t:entry-7",$time);
		join_any
		$display("%0t:entry-8",$time);
		end
		begin
		fork
		#3 $display("%0t:entry-9",$time);
		$display("%0t:entry-10",$time);
		join_none
		$display("%0t:entry-11",$time);
		#5;
		$display("%0t:entry-1",$time);
		end
	join
end
endmodule
		

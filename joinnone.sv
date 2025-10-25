module tb;
int i,j,value;
initial begin
	forever begin
		fork begin
			$display("%0t process %0d start",$time,i++);
			#10;
			$display("%0t process %0d complete",$time,j++);
		end
		join_none
		value=$urandom_range(10,40);
		$display("%0t:value=%0d",$time,value);
		#value;
	end
end
initial begin
	#200;
	$finish;
end
endmodule



module tb;
int arr[];
int que[$];
initial begin
	arr=new[50];
	arr[20]=100;
	que[20]=100;
	$display("arr=%p",arr);
	$display("que=%p",que);
end
endmodule

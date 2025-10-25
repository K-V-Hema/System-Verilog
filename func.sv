module tb;
int arr1[10];
int arr2[10];
int arr3[10];
function int arr(input int a1[10],a2[10],output int a3[10]);
	for(int i=0;i<10;i++) begin
		a3[i]=a1[i]+a2[i];
	end
endfunction
initial begin
	for(int i=0;i<10;i++) begin
	arr1[i]=$urandom_range(10,20);
	arr2[i]=$urandom_range(30,40);
	end
	arr3=arr(arr1,arr2);
	$display("arr1=%p",arr1);
	$display("arr2=%p",arr2);
	$display("arr3=%p",arr3);
end
endmodule



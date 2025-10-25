module tb;
int arr[];
int arr1[];
int position;
initial begin
	arr=new[5];
	foreach(arr[i]) begin
		arr[i]=$urandom_range(10,20);
	end
	$display("arr=%p",arr);
	arr1=new[5];
	foreach(arr[i]) begin
		arr1[i]=arr[arr.size()-1-i];
	end
	$display("arr1=%p",arr1);
end
endmodule

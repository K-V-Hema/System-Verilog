module tb;
int arr[],arr1[];
int position;
initial begin
	arr=new[5];
	foreach(arr[i]) begin
		arr[i]=$urandom_range(10,20);
	end
	$display("arr=%p",arr);
	arr1=arr;
	arr=new[6];
	position=2;
	foreach(arr[i]) begin
		if(i<position) arr[i]=arr1[i];
		else if(i==position) arr[i]=20;
		else arr[i]=arr1[i-1];
	end
$display("arr=%p",arr);
end
endmodule



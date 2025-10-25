module tb;
int arr[10]='{1,2,3,4,5,6,7,8,9,10};
int i,j,temp;
initial begin
	for(i=9;i>0;i--) begin 
		j=$urandom_range(0,i);
		temp=arr[i];
		arr[i]=arr[j];
		arr[j]=temp;
	$display("arr=%p",arr);
	end
end
endmodule
		

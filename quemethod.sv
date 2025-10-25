module tb;
int que[$];
int value;
initial begin
	for(int i=0;i<10;i++) begin
	value=$urandom_range(10,20);
	que.push_back(value);
	$display("que=%p",que);
	end
$display("size of queue=%0d",que.size());

for(int i=0;i<10;i++) begin
	value=que.pop_back();
	$display("que=%p",que);
end

for(int i=0;i<10;i++) begin
	value=$urandom_range(10,20);
	que.push_front(value);
	$display("que=%p",que);
end

for(int i=0;i<10;i++) begin
	value=$urandom_range(10,50);
	que.insert(3,15);
	$display("que=%p",que);
end

que.reverse();
	$display("que=%p",que);

que.shuffle();
	$display("que=%p",que);

que.delete(5);
	$display("que=%p",que);

que.delete();

	$display("que=%p",que);
end
endmodule



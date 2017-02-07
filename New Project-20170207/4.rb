=begin
We require a variable to store the number of iterations required to arrive at a
single winner. So if we have 2^n entries in input array. We need to find n. The
exp_value method finds that
=end

def exp_value a
    (1..a).to_a.detect {|n| 2**n >=a}
end

=begin
The following method gives the overall winner. It finds the winner for every
pair in the input array. Then iteratively goes on applying the same block of code
until only a single element is left which is the winner.
=end

def rps_tournament_winner(input_encoded)
    lookup_list=Hash["rr"=>0,"sr"=>1,"pr"=>0,"rs"=>0,"ss"=>0,"ps"=>1,"rp"=>1,"sp"=>0,"pp"=>0]
    xx=input_encoded.flatten.each_slice(2).to_a.each_slice(2).to_a

    #d is the variable that holds the size of the flattened input array.
    #Since each entry in input array consists of two elements: Name and strategy
    #Iterations required are the output value of exp_value (d)-1

    d=input_encoded.flatten.size
    iteration=exp_value(d)-1
    for round in 0..(iteration-1)
        c=Array.new(xx.size)
        for i in 0..((xx.size)-1)
            input=xx[i]
            string_check=("#{input[0][1]}"+"#{input[1][1]}").downcase
            c[i]=input[lookup_list[string_check]]
        end
        d=c.flatten.size
        xx=c.flatten.each_slice(2).to_a.each_slice(2).to_a
    end
    puts "#{xx}"
end

=begin
test case
rps_tournament_winner([
[
  [ ["Kristen", "P"], ["Dave", "S"] ],
  [ ["Richard", "R"], ["Michael", "S"] ],
],
[
  [ ["Allen", "S"], ["Omer", "P"] ],
  [ ["David E.", "R"], ["Richard X.", "P"] ]
]
])
=end

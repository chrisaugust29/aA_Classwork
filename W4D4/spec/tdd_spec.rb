require "tdd.rb"

describe "my_uniq" do
    let (:arr) {[1, 2, 1, 3, 3]}
    let (:result) {my_uniq(arr).dup}
    it "removes duplicates from array" do 
        expect(my_uniq(arr)).to eq([1,2,3])
    end
end

describe "two_sum" do 
    let (Array.new) {[-1, 0, 2, -2, 1]}
    it "find pairs of zero sum" do 
        expect(Array.new.two_sum).to eq([1,-1])
    it "orders indices from ascending order"

        expect(Array.new.two_sum).to eq([0,4],[2,3])
    end

end 
def my_uniq(arr)
    result = []
    arr.each do |ele|
        result << ele if !result.include?(ele)
    end
    result
end

class Array 
    def two_sum
        results = []

        self.each_with_index do |ele1, i|
            self.each_with_index do |ele2, j|
                if (ele1 + ele2 == 0) && (i < j)
                    results << [ele1, ele2]
                end
            end
        end
        results
    end

end


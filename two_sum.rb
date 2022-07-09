def bad_two_sum?(arr, target)#n(n^2)
    (0...arr.length).each do |i|
        ((i+1)...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end
    return false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target)#o(nlogn)
    array = arr.sort
    array.each_with_index do |ele, i|
        y = target - ele
       return true if array[i..-1].bsearch { |el| el == y}
    end
    return false
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target)
    hash = {}
    arr.each do |ele|
        y = target - ele
        if hash[y]
            return true
        else
            hash[ele] = true
        end
    end
    false
end


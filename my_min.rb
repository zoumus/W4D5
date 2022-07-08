def my_min1(arr)
    min = arr[0]
    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2,i2|
            if ele1 < ele2 && min > ele1
                min = ele1 
            elsif ele1 > ele2 && min > ele2
                min = ele2
            end
        end

    end
    min
end

def largest_contiguous_subsum1(list)#o(n^3)
    subs = []
    (0...list.length).each do |i|
        (i...list.length).each do |j|
                subs << list[i..j]            
        end
    end
    
    subs.map {|sub| sub.sum }.max
end

def largest_contiguous_subsum2(list)
    current_sum = list.first
    largest_sum = list.first
    i = 1
    while i < list.length
        if current_sum < 0
            current_sum = list[i]
            largest_sum = current_sum if largest_sum < current_sum
            i += 1
        else
            current_sum += list[i]
            largest_sum = current_sum if largest_sum < current_sum
            i += 1
        end
    end
    largest_sum
end



    list = [5,3,-7]
    list = [2,3,-6,7,-6,7]
  p  largest_contiguous_subsum1(list) # => 17
  p  largest_contiguous_subsum2(list) # => 17
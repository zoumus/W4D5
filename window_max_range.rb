def windowed_max_range(array, size)
    current = nil
    (0..array.length - size).each do |i|
        max_num = array[i..i+size-1].max
        min_num = array[i..i+size-1].min

        if current == nil || max_num - min_num > current
            current = max_num - min_num
        end
    end
    current
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        @store.length == 0
    end

    def enqueue(num)
        @store.push(num)
    end

    def dequeue
        @store.shift
    end
end

class MyStack
     def initialize
        @store = []
    end

    def peek
        @store.last
    end

    def size 
        @store.length
    end

    def empty?
        @store.empty?
    end
    
    def pop
        @store.pop
    end

    def push(num)
        @store.push(num)
    end

end

class StackQueue

    def initialize
        @store1 = MyStack.new
        @store2 = MyStack.new
        @current_stack = @store1
    end

    def size 
        @current_stack.length
    end

    def empty?
        @current_stack.empty?
    end

    def enqueue(num)
        @store2.push(@store1.pop)
        @store1.push(num) 
        if @current_stack != @store1
            flip 
        end      
    end


    def dequeue
        @store2.push(@store1.pop)
        if @current_stack != @store2
            flip 
        end  
        
    end
    private 
    def flip
         if @current_stack == @store1
            @current_stack = @store2
        else 
            @current_stack = @store1
        end
    end

end
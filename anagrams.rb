def anagram1(str1, str2)
    chars = str1.split('')
    chars.permutation do |ele|
        return true if ele.join == str2
    end
    false
end

# p anagram1("gizmo", "sally")    #=> false
# p anagram1("elvis", "lives")    #=> true

def anagram2(str1, str2) #o(n^2)
    chars2 = str2.split('')
    str1.each_char.with_index do |char, i|
        index = chars2.find_index(char)
        if index
            chars2.delete_at(index)
        end
    end
    chars2.empty?
end

#  p anagram2("gizmo", "sally")    #=> false
#  p anagram2("elvis", "lives")    #=> true

def anagram3(str1, str2) #o(n^2)
    str1.split('').sort == str2.split('').sort
end

#  p anagram3("gizmo", "sally")    #=> false
#  p anagram3("elvis", "lives")    #=> true

def anagram4(str1, str2) #o(n)
    str1.split('').tally == str2.split('').tally
end
#  p anagram4("gizmo", "sally")    #=> false
#  p anagram4("elvis", "lives")    #=> true

def anagram4(str1, str2)#o(n)
    hash = Hash.new(0)
    str1.each_char {|char| hash[char] += 1}
    str2.each_char {|char| hash[char] -= 1}

    hash.all? {|k, v| v == 0}
end
p anagram4("gizmo", "sally")    #=> false
p anagram4("elvis", "lives")    #=> true
Fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
    'fiiiissshhhhhh']


def sluggish(arr)
    temp = arr.dup
    longest = ''
    arr.each do |ele|
        if temp.all? {|ele2| ele2.length <= ele.length}
            longest = ele 
        end
    end
    longest
end

def dominate(arr)
    longest = ''
    arr.each do |ele|
        if ele.length > longest 
            longest = ele  
        end
    end
    longest
end

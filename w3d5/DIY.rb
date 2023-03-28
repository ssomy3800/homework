class Stack
    def initialize
      @stack = []
    end
  
    def push(el)
      # adds an element to the stack
      @stack<<(ele)
    end
  
    def pop
      # removes one element from the stack
      @stack.pop
    end
  
    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[0]
    end
  end

#   class Array
#     def merge(left, right)
#         merge = []
#         while !left.empty? && !right.empty?
#             if left[0]> right[0]
#                 merge << right.shift
#             else
#                 merge << left.shift
#             end
#         end
#         merge + left + right 
#     end

#     def merge_sort
#         return self if self.length <=1
#         sorted = []
#         mid = self.length/2
#         left = self[0...mid]
#         right = self[mid..-1]
#         ls = left.merge_sort
#         rs = right.merge_sort
#         sorted = merge(ls,rs)
#     end

# end

# arr = [8,5,1,7,4,6,9,2] 
# arr2 = [4,3,2,5,4]
# p arr.merge_sort
# p arr.merge(arr,arr2)

class Array
    def self.merge(left,right)
        merge = []
        while !left.empty? && !right.empty?
            if left[0]> right[0]
                merge << right.shift
            else
                merge << left.shift
            end
        end
        merge + left + right 
    end

    def merge_sort
        return self if self.length <=1
        sorted = []
        mid = self.length/2
        left = self[0...mid]
        right = self[mid..-1]
        ls = left.merge_sort
        rs = right.merge_sort
        sorted = Array.merge(ls,rs)
    end

end

arr = [8,5,1,7,4,6,9,2] 
arr2 = [4,3,2,5,4]
p arr.merge_sort
p Array.merge(arr,arr2)
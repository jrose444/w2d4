def my_min(list)
  list.each_with_index do |ele_1, idx_1|
    return ele_1 if list[idx_1+1..-1].all? { |ele_2| ele_2 > ele_1 }
  end
end

def my_min_2(list)
  list.inject { |acc, ele| ele < acc ? ele : acc }
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)
# p my_min_2(list)

def largest_contiguous_subsum(list)
  sub_arrays = []
  list.each_with_index do |ele_1, idx_1|
    list.each_with_index do |ele_2, idx_2|
      if idx_2 > idx_1
        sub_arrays << list[idx_1..idx_2]
      end
    end
  end
  sub_sums = sub_arrays.map(&:sum)
  sub_sums.inject {|acc, ele| ele > acc ? acc = ele : acc }
end

 list = [2, 3, -6, 7, -6, 7]
  # p  largest_contiguous_subsum(list)

def largest_contiguous_subsum_2(list)
  highest_sum = 0
  current_sum = 0
  
  
  list.each do |ele|
    current_sum += ele
    current_sum = 0 if current_sum < 0
    if current_sum > highest_sum
      highest_sum = current_sum
    end
  end
  highest_sum
end

# p largest_contiguous_subsum_2(list)

def first_anagram?(str, str_2)
  all_anagrams = str.chars.permutation.to_a
  all_anagrams.include?(str_2.chars)
end

# p first_anagram?("bat", "ab")

def second_anagram(str, str_2)
  str.each_char do |char|
    temp_index = str_2.index(char)
    if temp_index
      str_2[temp_index] = ""
    else
      return false
    end
  end

  return true if str_2 == ""
end

# p second_anagram("bat", "ab")
# p second_anagram("apple", "ppale")

def third_anagram(str, str_2)
  str.chars.sort == str_2.chars.sort
end

# p third_anagram("bat", "tb")
# p third_anagram("apple", "ppale")

def fourth_anagram(str, str_2)
  anagram_1 = Hash.new { |h, k| h[k] = 0 }
  anagram_2 = Hash.new { |h, k| h[k] = 0 }

  str.each_char { |char| anagram_1[char] += 1 }
  str_2.each_char { |char| anagram_2[char] += 1 }

  anagram_1 == anagram_2
end

# p fourth_anagram("bat", "tb")
# p fourth_anagram("apple", "ppale")

def fourth_anagram_2(str, str_2)
  anagram = Hash.new { |h, k| h[k] = 0 }

  str.each_char { |char| anagram[char] += 1 }
  str_2.each_char { |char| anagram[char] -= 1 }

  anagram.values.sum.zero?
end

# p fourth_anagram_2("bat", "tb")
# p fourth_anagram("apple", "ppale")

def bad_two_sum?(arr, target)
  arr.each_with_index do |ele_1, idx_1|
    arr.each_with_index do |ele_2, idx_2|
      if idx_2 > idx_1
         return true if ele_1 + ele_2 == target
      end
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10)

def okay_two_sum?(arr, target)
  sorted = arr.sort
  sorted.each_with_index do |num, idx|
    new_target = target - num
        b_search = binary_search(sorted, new_target)
      if idx != b_search && b_search != nil
        return true
      end
    
  end
false
end

def binary_search(arr, target)

  return nil if arr.length == 0
  
  mid = arr.length/2
  return mid if arr[mid] == target

  left = arr.take(mid)
  right = arr.drop(mid+1)

  if arr[mid] > target
    binary_search(left, target)
  else
    result = binary_search(right, target)
    if result == nil
      return nil
    else
      return result + mid + 1
    end
  end
end

p okay_two_sum?(arr = [0, 1, 3, 7], 6)
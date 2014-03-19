# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
# Find the largest palindrome made from the product of two 3-digit numbers.


require 'benchmark'
  
def is_palindrome?(num)
  array = num.to_s.chars.map(&:to_i)
  iter = (array.length/2.0).round - 1
  temp = []
  0.upto(iter).each do |i|
    if array[i] != (array[-i - 1])
      temp << false
    else
      temp << true
    end
  end
  if temp.include?(false)
    return false
  else
    return true
  end
end

def largest_palindrome_of_product(low, high)
  products = []
  palindromes = []
  high.downto(low) { |n| high.downto(low) { |i| products << i*n } }
  products.sort.reverse.each do |x| 
    if is_palindrome?(x)
      puts x
      break
    end
  end
end




time = Benchmark.realtime do
  largest_palindrome_of_product(100,999)
end

puts time
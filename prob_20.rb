# n! means n  (n  1)  ...  3  2  1
# For example, 10! = 10  9  ...  3  2  1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!


def factorial_sum(num)
  value = num
  while num > 1 do
    num -= 1 
    value = (value * num)
  end
  array = value.to_s.scan(/./)
  sum = array.inject(0) { |sum, i| sum + i.to_i }
  puts sum
end
    
    
puts factorial_sum(100)
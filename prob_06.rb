# The sum of the squares of the first ten natural numbers is,
# 1**2 + 2**2 + ... + 10**2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)**2 = 55**2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


list = []
squares = []
1.upto(100).each { |x| list << x }
list.each {|x| squares << x**2}
diff = (list.inject(0) {|sum,x| sum + x})**2 - (squares.inject(0) {|sum, x| sum + x})
puts diff

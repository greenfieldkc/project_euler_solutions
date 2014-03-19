##If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
##Find the sum of all the multiples of 3 or 5 below 1000.

multiples_of_three = []
multiples_of_five = []
1.upto(999).each do |x|
  if x%3 == 0
    multiples_of_three << x
  elsif x%5 == 0
    multiples_of_five << x
  end
end

multiples_of_both = multiples_of_three + multiples_of_five
multiples_of_both.uniq!
sum = multiples_of_both.inject(0) { |sum, x| sum + x }
puts sum
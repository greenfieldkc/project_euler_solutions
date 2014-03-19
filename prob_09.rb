# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a**2 + b**2 = c**2
# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2. 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

require 'benchmark'

def find_abc(num)
  1.upto(999).each do |a|
    1.upto(999).each do |b|
      return puts a*b*Math.sqrt(a**2 + b**2) if (a + b + Math.sqrt(a**2 + b**2)) == 1000
    end
  end
end


time = Benchmark.realtime do
  find_abc(1000)
end

puts time
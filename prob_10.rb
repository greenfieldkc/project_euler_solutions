# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.
require 'benchmark'



def prime_sieve_with_array(max_value) #solves correctly, but slow. solved 200,000 in 30 seconds the deletion function for array is the holdup
  confirmed_primes = [2,3,5,7,11,13,17]
  num_array = []
  2.upto(max_value).each { |i|  num_array << i unless (i%2 == 0 || i%3 == 0 || i%5 == 0 || i%7 == 0 || i%11 == 0 || i%13 == 0 || i%17 == 0) }
  while num_array[0] <= Math.sqrt(max_value)
    confirmed_primes << num_array.shift
    num_array.each { |i| num_array.delete(i) if i%confirmed_primes[-1] == 0 }
  end
  confirmed_primes += num_array
  puts confirmed_primes.inject(0) {|sum, i| sum += i }
end

def prime_sieve_with_hash(max_value) #solves for 200,000 in 0.42 seconds and 2million in 7.2 seconds on local machine
  hash = {}
  2.upto(max_value).each { |i|  hash[i] = i }
  2.upto(Math.sqrt(max_value)).each do |num|
    unless hash[num] == 0
      counter = num
      while counter <= max_value
        counter += num
        hash[counter] = 0
      end
    end
  end
  sum = 0
  hash.each {|key, val| sum += val } 
  puts sum
end

def prime_sieve_hash_and_array(max_value) #solves for 200,000 in 0.19 seconds and 2million in 3.5 seconds
  hash = {}
  num_array = []
  2.upto(max_value).each { |i| num_array << i unless (i%2 == 0 || i%3 == 0 || i%5 == 0 || i%7 == 0 || i%11 == 0 || i%13 == 0 || i%17 == 0) }
  num_array.each {|i| hash[i] = i}
  num_array.each do |num|
    break if num > Math.sqrt(max_value)
    unless hash[num] == 0
      counter = num
      while counter <= max_value
        counter += num
        hash[counter] = 0
      end
    end
  end
  sum = 58 #sum of starting primes 2..17
  hash.each {|key, val| sum += val } 
  puts sum
end

time = Benchmark.realtime do
  prime_sieve_hash2(2000000)
end
puts time
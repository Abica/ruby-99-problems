# Problem 31
# Determine whether a given integer number is prime.
def prime?( p )
  return false if p < 1
  return true if p <= 2

  # I seriously refuse to make a separate method for this.. number_of_methods.should == number_of_problems
  # DO YOU READ ME ALEX? I KNOW YOU DO!
  factorial = lambda do | n |
    ( 1..n ).inject { | product, item | product * item }
  end

  remainder = ( factorial.call( p - 1 ) + 1 ) % p
  remainder.zero?
end

# Problem 32
# Determine the greatest common divisor of two positive integer numbers.
def gcd( a, b )
  return a if b.zero?
  gcd b, a % b
end

# Problem 33
# Determine whether two positive integer numbers are coprime.
def coprime?( a, b )
  gcd( a, b ) == 1
end

# Problem 34
# Calculate Euler's totient function phi(m).
def totient_phi( m )
  return 1 if m == 1
  ( 1...m ).inject( 0 ) do | sum, item |
    coprime?( m, item ) ? sum + 1 : sum
  end
end

# Problem 35
# Determine the prime factors of a given positive integer.
def prime_factors( n )
end

# Problem 36
# Determine the prime factors of a given positive integer (2).
def prime_factors_mult( n )
end

# Problem 39
# A list of prime numbers. 
def prime_r( start, stop )
  ( start..stop ).select { | n | prime? n }
end

# Problem 40
# Goldbach's conjecture. Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of the most famous facts in number theory that has not been proved to be correct in the general case. It has been numerically confirmed up to very large numbers (much larger than we can go with our Prolog system). Write a predicate to find the two prime numbers that sum up to a given even integer. 

# Problem 41
# Given a range of integers by its lower and upper limit, print a list of all even numbers and their Goldbach composition. 

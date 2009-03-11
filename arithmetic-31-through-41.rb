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
end

# Problem 35
# Determine the prime factors of a given positive integer.
def prime_factors( n )
end

# Problem 36
# Determine the prime factors of a given positive integer (2).
def prime_factors_mult( n )
end

require File.expand_path( File.dirname(__FILE__) + "/../arithmetic-31-through-41.rb" )

describe "Arithmetic" do
  describe "Problem 31 - prime?" do
    it "should return true if n is prime, false otherwise" do
      primes = [ 1, 2, 3, 5, 7 ]
      not_primes = [ 4, 6, 8, 10, 12 ]
      primes.zip( not_primes ).each do | prime, not_prime |
        prime?( prime ).should be_true 
        prime?( not_prime ).should_not be_true 
      end
    end
  end

  describe "Problem 32 - gcd" do
    it "should return the gcd of a and b" do
      gcd( 21, 133 ).should == 7
      gcd( 221, 1133 ).should == 1
      gcd( 2, 59 ).should == 1
    end
  end

  describe "Problem 33 - coprime?" do
    it "should return true if a and b are coprime" do
      coprime?( 21, 133 ).should_not be_true
      coprime?( 221, 1133 ).should be_true
      coprime?( 2, 59 ).should be_true
    end
  end

  describe "Problem 34 - totient_phi" do
    it "should return the last element in an array" do
      totients_1_to_10 = [ 1, 1, 2, 2, 4, 2, 6, 4, 6 ]
      (1...10).map {|l| totient_phi l}.should == totients_1_to_10
    end
  end

  describe "Problem 35 - prime_factors" do
    it "should return the last element in an array"
  end

  describe "Problem 36 - prime_factors_mult" do
    it "should return the last element in an array"
  end
  
  describe "Problem 39 - prime_r" do
    it "should return a list of prime numbers in a range" do
      primes = [ 1, 2, 3, 5, 7, 11 ]
      prime_r( 1, 12 ).should == primes
    end
  end
end

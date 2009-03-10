require File.expand_path(File.dirname(__FILE__) + "/../lists-1-through-28")

describe "Lists" do
  before :each do 
    @list = [ 1, 2, 3, 4, 5 ]
  end

  describe "Problem 1 - my_last" do
    it "should return the last element in an array" do
      my_last( @list ).should == 5
    end
  end

  describe "Problem 2 - my_but_last" do
    it "should return the next to last element in an array" do
      my_but_last( @list ).should == 4
    end
  end

  describe "Problem 3 - element_at" do
    it "should return the k'th element in an array, starting with index 1" do
      @list.each_with_index do | item, index |
        element_at( @list, index + 1 ).should == item
      end
    end
  end

  describe "Problem 4 - length" do
    it "should return the length of an array" do
      length( @list ).should == @list.size
    end
  end

  describe "Problem 5 - reverse" do
    it "should reverse the elements of an array" do
      reverse( @list ).should == @list.reverse
    end
  end

  describe "Problem 6 - palindrome?" do
    it "should be true if the argument is identical reversed" do
      palindrome?( "racecar" ).should be_true
      palindrome?( "abcd" ).should_not be_true
    end
  end

  describe "Problem 7 - flatten" do
    it "should take a nested array and return a single level array" do
      nested_list = [ 1, 2, [ 1, 2 ], [ 1, [ 1, 2, 3 ] ] ]
      flatten( nested_list ).all? { | item | not item.is_a? Array }.should be_true
    end
  end

  describe "Problem 8 - compress" do
    it "should remove consecutive duplicates from an array" do
      list_with_dups = [ 1, 1, 2, 2, 3, 4, 4, 2, 2, 4, 4, 5, 5 ]
      compress( list_with_dups ).should == [ 1, 2, 3, 4, 2, 4, 5 ]
    end
  end

  describe "Problem 9 - pack" do
    it "should group consecutive duplicates into sub lists" do
      list_with_dups = [ 1, 1, 2, 2, 3, 4, 4, 2, 2, 4, 4, 5, 5 ]
      pack( list_with_dups ).should == [ [ 1, 1 ], [ 2, 2 ], [ 3 ], [ 4, 4 ], [ 2, 2 ], [ 4, 4 ], [ 5, 5 ] ]
    end
  end

  describe "Problem 10 - encode" do
    it "should take a list and return a run length encoded array" do
      non_encoded_list = %w{ a a a b c c d d d d }
      encode( non_encoded_list ).should == [ [ 3, "a" ], [ 1, "b" ], [ 2, "c" ], [ 4, "d" ] ]
    end
  end

  describe "Problem 11 - encode_modified" do
    it "should take a list and return a run length encoded array with single elements flattened" do
      non_encoded_list = %w{ a a a b c c d d d d }
      encode_modified( non_encoded_list ).should == [ [ 3, "a" ], "b", [ 2, "c" ], [ 4, "d" ] ]
    end
  end

  describe "Problem 12 - decode_modified" do
    it "should take a the modified run length encoded list from problem 12 and decode it into an array" do
      non_encoded_list = %w{ a a a b c c d d d d }
      encoded_list = encode_modified( non_encoded_list )
      decode_modified( encoded_list ).should == non_encoded_list
    end
  end

  describe "Problem 14 - dupli" do
    it "should duplicate every item in a list"
  end

  describe "Problem 15 - repli" do
    it "should replicate every item in a list n times"
  end

  describe "Problem 16 - drop_every" do
    it "should remove every n'th element from an array"
  end

  describe "Problem 17 - split" do
    it "should split an array into 2 parts, where the first array is size n and the second is the remainder"
  end

  describe "Problem 18 - slice" do
    it "should return a list containing only elements between start and stop"
  end

  describe "Problem 19 - rotate" do
    it "should wrap n items to the left for positive n"
    it "should wrap n items to the right for negative n"
  end

  describe "Problem 20 - remove_at" do
    it "should return an array with n removed"
  end
end

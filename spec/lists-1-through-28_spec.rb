require File.expand_path(File.dirname(__FILE__) + "/../lists-1-through-28")

describe "Lists" do
  before :each do 
    @list = [ 1, 2, 3, 4, 5 ]
  end

  describe "Problem 1 - my_last" do
    it "should return the last element in an array" do
      my_last( @list ).should == @list.last
    end
  end

  describe "Problem 2 - my_but_last" do
    it "should return the next to last element in an array" do
      my_but_last( @list ).should == @list[ -2 ]
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
    it "should duplicate every item in a list" do
      dupli( [ 1, 2, 3 ] ).should == [ 1, 1, 2, 2, 3, 3 ]
    end
  end

  describe "Problem 15 - repli" do
    it "should replicate every item in a list n times" do
      list = [ 1, 2, 3 ]
      repli( list, 2 ).should == dupli( list )
      repli( list, 4 ).should == [ 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3 ]
    end
  end

  describe "Problem 16 - drop_every" do
    it "should remove every n'th element from an array" do
      list = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
      drop_every( list, 1 ).should be_empty
      drop_every( list, 2 ).should == [ 1, 3, 5, 7 ]
      drop_every( list, 3 ).should == [ 1, 2, 4, 5, 7, 8 ]
    end
  end

  describe "Problem 17 - split" do
    it "should split an array into 2 parts, where the first array is size n and the second is the remainder" do
      n = 4
      left, right = split( @list, n )
      left.size.should == n
      ( left.size + right.size ).should == @list.size
      ( left + right ).should == @list
    end
  end

  describe "Problem 18 - slice" do
    it "should return a list containing only elements between start and stop, starting with index 1" do
      start, stop = 2, 4
      slice( @list, start, stop ).should == @list.slice( start - 1, stop - 1 )
    end
  end

  describe "Problem 19 - rotate" do
    it "should wrap n items to the left for positive n" do
      list = [ 1, 2, 3, 4, 5 ]
      rotate( list, 2 ).should == [ 3, 4, 5, 1, 2 ]
    end

    it "should wrap n items to the right for negative n" do
      list = [ 1, 2, 3, 4, 5 ]
      rotate( list, -2 ).should == [ 4, 5, 1, 2, 3 ]
    end

    it "should wrap the list several times when n is out of bounds" do
      list = [ 1, 2, 3, 4, 5 ]
      rotate( list, 13 ).should == [ 4, 5, 1, 2, 3 ]
      rotate( list, -13 ).should == [ 3, 4, 5, 1, 2 ]
    end
  end

  describe "Problem 20 - remove_at" do
    it "should return an array with n removed" do
      list = [ 1, 2, 3, 4 ]
      remove_at( 2, list ).should == [ 1, 2, 4 ]
    end
  end

  describe "Problem 21 - insert_at" do
    it "should insert an item into an array at n" do
      insert_at( "s", [ 1, 2, 3 ], 2 ).should == [ 1, 2, "s", 3 ]
    end
  end

  describe "Problem 22 - range" do
    it "should return an array of integers from start to stop" do
      start, stop = 40, 430
      range( 40, 430 ).should == [ *start..stop ]
    end
  end

  describe "Problem 23 - rnd_select" do
    it "should return a shuffled array of n elements from a source array" do
      rand_list = rnd_select( @list, 3 )
      rand_list.size.should == 3
      rand_list.should_not == @list[ 0...3 ]
    end
  end

  describe "Problem 24 - diff_select" do
    it "should return an array with n removed" do
      lotto_numbers = diff_select( 7, 10000 )
      lotto_numbers.size.should == 7
      lotto_numbers.should_not == diff_select( 7, 10000 )
    end
  end

  describe "Problem 25 - rnd_permu" do
    it "should return a randomly sorted list" do
      rand_list = rnd_permu( @list )
      rand_list.should_not == @list
      rand_list.sort.should == @list
    end
  end

  describe "Problem 28a - lsort" do
    it "should return an array sorted by the length of it's sublists" do
      list = [ [ 1, 2, 3 ], [ 1, 2 ], [ 1, 2, 3, 4 ], [ 1 ] ]
      lsort( list ).should == [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]
    end
  end

  describe "Problem 28b - lfsort" do
    it "should an array based on the frequency of the length of it's sublists, order by rarity asc" do
      list = [ [ 1, 2, 3 ], [ 1 ], [ 1, 2 ], [ 2 ], [ 2, 3 ], [ 5 ] ]
      lfsort( list ).should == [ [ 1, 2, 3 ], [ 1, 2 ], [ 2, 3 ], [ 1 ], [ 2 ], [ 5 ] ]
    end
  end
end

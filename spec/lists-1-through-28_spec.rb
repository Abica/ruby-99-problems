require File.expand_path(File.dirname(__FILE__) + "/../lists-1-through-28")

describe "Problem 1 - my_last" do
  it "should return the last element in an array" do
    my_last( [1,2,3,4,5] ).should == 5
  end
end

describe "Problem 2 - my_but_last" do
  it "should return the the next to last element in an array" do
    my_but_last( [1,2,3,4,5] ).should == 4
  end
end

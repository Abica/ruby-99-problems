# Problem 1
# Find the last element of a list.
def my_last( list )
  list[ -1 ]
end

# Problem 2
# Find the last but one element of a list. 
def my_but_last( list )
  list[ -2 ]
end

# Problem 3
# Find the K'th element of a list. The first element in the list is number 1. 
def element_at( list, index )
  list[ ( index - 1 ).abs ]
end

# Problem 4
# Find the number of elements of a list. 
def length( list )
  list.inject( 0 ) { | sum, _ | sum + 1 }
end

# Problem 5
# Reverse a list. 
def reverse( list )
  new_list = []
  ( list.size - 1 ).downto( 0 ) do | index |
    new_list.push list[ index ]
  end
  new_list
end

# Problem 6
# Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x). 
def palindrome?( list )
  list.reverse == list
end

# Problem 7
# Flatten a nested list structure. 
def flatten( list )
  return [ list ] unless list.is_a? Array

  list.inject( [] ) do | ary, item |
    ary + my_flatten( item )
  end
end

# Problem 8
# Eliminate consecutive duplicates of list elements. 
def compress( list )
  new_list = []
  last_item = nil
  list.each do | item |
    new_list << item unless last_item == item
    last_item = item
  end
  new_list
end

# Problem 9
# Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists. 
def pack( list )
  new_list = []
  last_item = nil
  list.each do | item |
    new_list << [] unless last_item == item
    new_list.last << item
    last_item = item
  end
  new_list
end

# Problem 10
# Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
def encode( list )
  pack( list ).map do | items |
    [ items.size, items.first ]
  end
end


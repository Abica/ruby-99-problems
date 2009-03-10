# Problem 1
# Find the last element of a list.
def my_last( list )
  element_at list, length( list )
end

# Problem 2
# Find the last but one element of a list. 
def my_but_last( list )
  element_at list, length( list ) - 1
end

# Problem 3
# Find the K'th element of a list. The first element in the list is number 1. 
def element_at( list, n )
  size = length( list )
  list.each_with_index do | item, index |
    break item if n - 1 == index
  end
end

# Problem 4
# Find the number of elements of a list. 
def length( list )
  list.inject( 0 ) { | sum, _ | sum + 1 }
end

# Problem 5
# Reverse a list. 
#
# for james & alex
def reverse( list )
  return [] if list.empty?
  head, *tail = list
  reverse( tail ) + [ head ]
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
    ary + flatten( item )
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

# Problem 11
# Modified run-length encoding. Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists. 
def encode_modified( list )
  pack( list ).map do | items |
    size = items.size
    item = items.first
    if size == 1
      item
    else
      [ size, item ]
    end
  end
end

# Problem 12
# Decode a run-length encoded list. Given a run-length code list generated as specified in problem 11. Construct its uncompressed version. 
def decode_modified( list )
  list.inject( [] ) do | ary, (n, item) |
    if item
      ary + [ item ] * n
    else
      ary << n
    end
  end
end

# Problem 13
# Run-length encoding of a list (direct solution). Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 9, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X. 

# Problem 14
# Duplicate the elements of a list. 
def dupli( list )
  repli list, 2
end

# Problem 15
# Replicate the elements of a list a given number of times. 
def repli( list, times )
  list.inject( [] ) do | ary, item |
    ary + ( [ item ] * times )
  end
end

# Problem 16
# Drop every N'th element from a list. 
def drop_every( list, n )
  index = 1
  list.select do
    skip = !( index % n ).zero?
    index += 1
    skip
  end
end

# Problem 17
# Split a list into two parts; the length of the first part is given. 
def split( list, size )
  new_list = [ [], [] ]
  list.each_with_index do | item, index |
    if index < size
      new_list.first << item
    else
      new_list.last << item
    end
  end
  new_list
end

# Problem 18
# Extract a slice from a list. 
def slice( list, start, stop )
  list[ start - 1 .. stop - 1 ]
end

# Problem 19
# Rotate a list N places to the left. 
def rotate( list, n )
  list_size = length( list )
  negative = n < 0
  if n > list_size or n < -list_size
    n = n.abs % list_size
    n = -n if negative
  end

  size = negative ? list_size + n : n
  left, right = split( list, size )
  right + left 
end

# Problem 20
# Remove the K'th element from a list. 
def remove_at( index, list )
  list.delete_at index - 1
  list
end

# Problem 21
# Insert an element at a given position into a list. 
def insert_at( item, list, n )
  left, right = split( list, n - 1 )
  left + [ item ] + right
end

# Problem 22
# Create a list containing all integers within a given range. 
def range( start, stop )
  list = []
  start.upto stop do | number |
    list.push number
  end
  list
end

# Problem 23
# Extract a given number of randomly selected elements from a list. 
def rnd_select( list, n )
  list.sort_by { rand }[ 0...n ]
end

# Problem 24
# Lotto: Draw N different random numbers from the set 1..M. 
def diff_select( n, max ) 
  rnd_select range( 1, max ), n
end

# Problem 25
# Generate a random permutation of the elements of a list. 
def rnd_permu( list )
  rnd_select list, length( list )
end

# Problem 26
# Generate the combinations of K distinct objects chosen from the N elements of a list In how many ways can a committee of 3 be chosen from a group of 12 people? We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficients). For pure mathematicians, this result may be great. But we want to really generate all the possibilities in a list. 

# Problem 27
# Group the elements of a set into disjoint subsets.

# a) In how many ways can a group of 9 people work in 3 disjoint subgroups of 2, 3 and 4 persons? Write a function that generates all the possibilities and returns them in a list.

# b) Generalize the above predicate in a way that we can specify a list of group sizes and the predicate will return a list of groups. 

# Problem 28
# Sorting a list of lists according to length of sublists 

# a) We suppose that a list contains elements that are lists themselves. The objective is to sort the elements of this list according to their length. E.g. short lists first, longer lists later, or vice versa.
def lsort( list )
  list.sort
end

# b) Again, we suppose that a list contains elements that are lists themselves. But this time the objective is to sort the elements of this list according to their length frequency; i.e., in the default, where sorting is done ascendingly, lists with rare lengths are placed first, others with a more frequent length come later. 
#
# I made this one extra special, just for you, Chris ;)
def lfsort( list )
  frequencies = list.inject( {} ) do | hsh, item |
    hsh[ item.size ] ||= []
    hsh[ item.size ] << item
    hsh
  end

  frequencies.sort { | a, b | b <=> a }.inject( [] ) { | ary, item | ary + item.last }
end

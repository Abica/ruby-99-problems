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
def duplicate( list )
  replicate list, 2
end

# Problem 15
# Replicate the elements of a list a given number of times. 
def replicate( list, times )
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

# Problem 20
# Remove the K'th element from a list. 
def remove_at( index, list )
  list.delete_at index
  list
end

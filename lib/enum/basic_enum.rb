# Basic enumeration on collection objects (hash, array)

# This is NOT the Enumerable module.
# The name is close, but this is just us writing implementation of all of the enumerable methods in actions
class MyEnumeration
  # Do not modify the initialize
  # This statement allows the rspec tests to create a new collection that will then be tested
  # MyEnumeration.new(['foo', 'bar'])
  def initialize(collection)
    @collection = collection
  end

  # EXAMPLE: THIS ONE IS DONE FOR YOU
  # Refer to count
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-count
  def number_of_elements_in_collection
    # collection here refers to the collection that is set with the initialize method
    # collection() is a private accessor method at the bottom of this class that accesses @collection
    collection.count
  end

  # This one also uses 'count'
  # Try it yourself!
  def number_of_floats_or_fixnums
    collection.count { |x| x.is_a?(Numeric)}
  end

  # Refer to: all?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-all-3F
  def all_words_longer_than_length?(min_length)
    collection.all? { |x| x.length > min_length}
  end


  # For the next 3 methods refer to: collect or map
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-any-3F
  def contains_a_word_longer_than?(min_length)
    collection.any? { |x| x.length > min_length}
  end

  def capitalize_words
    collection.map { |x| x.capitalize}
  end

  def square_numbers
    collection.map { |x| x ** 2}
  end

  # Use symbol to proc notation on this one!
  def reverse_words
    collection.map { |x| x.reverse}
  end

  # Refer to collect_concat or flat_map for these next two
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-flat_map
  # To get the order right for the tests, you'll need to use the absolute value method
  def positive_and_negative_numbers
    collection.flat_map {|x| [x.abs, -(x.abs)]}
  end

  # Refer to detect or find
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-detect
  def find_first_awesome_person
    collection.detect { |x| x[:awesome] == true}
  end

  # Refer to drop
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-drop
  def remove_first_three
    collection.drop(3)
  end

  # Refer to drop_while
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-drop_while
  def drop_until_its_hot
    collection.drop_while {|x| x != "hot"}
  end


  # Refer to each_slice
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-each_slice
  # Tip: After .each_slice chain on .to_a to turn the returned Enumerator into an array
  def groups_of(num)
    collection.each_slice(num).to_a
  end


  # Refer to each_with_object
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-each_with_object
  # Tip: You'll have to do .each_with_object(Hash.new(0)) to create a hash to start with. Do not save the hash in a variable. You may use the incrementor method here.
  def element_frequency_count
    collection.each_with_object(Hash.new(0)) { |element, hash| hash[element] += 1; collection.count
      (element)}
  end


  # Refer to find_all / select
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-find-all
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-select
  def elements_ending_in_er
    collection.find_all { |word| word.end_with?("er")}
  end


  # Refer to find_index
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-find-index
  def index_of_first_awesome_element
    collection.find_index { |x| x[:awesome] == true}

  end

  # Refer to group_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-group-by
  def group_elements_by_favorite_language
    collection.group_by { |x| x[:favorite_language]}
  end

  # Refer to inject / reduce
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-inject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reduce
  def sum_of_experiences
    collection.inject(0) { |sum, x| sum + x[:years_experience]}
  end

  # Refer to inject / reduce
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-inject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reduce
  def longest_element_name_using_inject
    collection.inject do |memo, x| memo[:name].length > x[:name].length ? memo : x
  #had to look up example answer to realize I forgot to compare [:name] in memo. had only memo.length before
    end
  end


  # Refer to max_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-max-by
  def most_experienced_element
    collection.max_by { |x| x[:years_experience]}
  end

  # Refer to include? / member?
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-include-3F
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-member-3F
  def element_present?(name)
    collection.include? name
  end

  # Refer to minmax_by
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-minmax_by
  def elements_with_longest_and_shortest_names
    collection.minmax { |a, b| a[:name].length <=> b[:name].length}
  end

  # Refer to partition
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-partition
  def separate_elements_that_like_functional_programming_from_rest
    collection.partition.each_with_index { |x| x[:likes_functional_programming] == true}
  end

  # Refer to reject
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-reject
  def elements_who_dislike_functional_programming
    collection.reject { |x| x[:likes_functional_programming] == true}
  end

  # Refer to sort
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-sort
  # You will need to use the 'spaceship' operator <=>
  def elements_sorted_by_experience
    collection.sort { |exp_1, exp_2| exp_1[:years_experience] <=> exp_2[:years_experience]}
  end

  # Refer to take
  # http://ruby-doc.org/core-2.1.4/Enumerable.html#method-i-take
  def first_x_elements(x)
    collection.take(x)
  end

  private

  def collection
    @collection
  end

end

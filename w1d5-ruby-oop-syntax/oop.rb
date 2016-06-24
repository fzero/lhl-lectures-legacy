# Use the `class` keyword to define a class
# Think of a class as a template containing everything an instance
# of that class will have - a book, in this case.
class Book

  # Class variables are prefixed with @@
  # These are available to all instances of a class and are persisted
  # in the class itself. This is a counter that gets incremented every
  # time a new book instance is created (See initialize.)
  @@books_created = 0

  # Attribute readers/writers/accessors are shortcuts that create
  # methods that make instance variables accessible from each instance.
  # They actually generate instance methods on the fly, so:

  # attr_reader :title
  #
  # Is the same as:
  #
  # def title
  #   @title
  # end

  # attr_writer :title
  #
  # Is the same as:
  #
  # def title=(new_title)
  #   @title = new_title
  # end
  #
  # attr_accessor does both at the same time

  attr_accessor :title, :author, :genre, :isbn, :year
  attr_reader :pages, :reviews

  # This is a valid initialize method using regular method parameters.
  # There's nothing wrong with this, but I prefer to use Hashes to initialize
  # objects with more than three parameters (see below)

  # def initialize(title=nil, author=nil, pages=nil, genre=nil, isbn=nil, year=nil)
  #   @title = title
  #   @author = author
  #   @pages = pages
  #   @genre = genre
  #   @isbn = isbn
  #   @year = year
  #   @reviews = []
  #
  #   @@books_created += 1
  # end

  def initialize(options={})
    @title = options[:title]
    @author = options[:author]
    @pages = options[:pages]
    @genre = options[:genre]
    @isbn = options[:isbn]
    @year = options[:year]
    @reviews = []

    @@books_created += 1
  end


  # Every class has a "magical" `to_s` method that's used internally
  # by Ruby to display the contents of an object as a string.
  # We're overriding the default `to_s` inherited from Object here
  # to display our data properly.
  def to_s
    "Author: #{@author}, Title: #{@title}"
  end


  # We've created a custom attribute writer here to make sure the number
  # of pages is always a number.
  def pages=(new_pages)
    return unless new_pages.is_a?(Integer)
    @pages = new_pages
  end


  # This is just a silly example of instance method.
  # Note how we can call our `secret` private method here, but
  # we can't call `secret` directly from a book instance.
  def flip_pages
    secret
    puts "It makes a nice sound: FRRRRRIIIPPP"
  end


  # This is also a custom attribute writer. We must make sure
  # our reviews are instances of the Review class.
  def add_review(review)
    return unless review.is_a?(Review)
    @reviews << review
  end


  # Here we're calculating the average review rating on the fly based on
  # the Review objects stored inside @reviews.
  def avg_rating
    return "No reviews." if @reviews.empty?
    total = 0.0
    @reviews.each {|r| total += r.rating}
    total / @reviews.size
  end

  # Create a class method by prefixing the method name with `self.`
  # def self.books_created
  #   @@books_created
  # end

  # If you have many class methods, you can also do this:
  class << self

    def books_created
      @@books_created
    end


    def compare(book1, book2)
      (
        book1.title == book2.title &&
        book1.author == book2.author &&
        book1.genre == book2.genre &&
        book1.year == book2.year &&
        book1.isbn == book2.isbn &&
        book1.pages == book2.pages
      )
    end

  end


  # All methods in a class are public unless you use `private` or
  # `protected`. These methods are available internally to the class, but
  # can't be called from the instance.
  private

  def secret
    puts "This is a secret method"
  end

end


# This is the review class that can be associated with Book instances.
class Review

  attr_reader :rating, :comment

  def initialize(rating, comment=nil)
    @rating = rating
    @comment = comment
  end

end

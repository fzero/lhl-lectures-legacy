class Author < ActiveRecord::Base
  has_many :articles

  def fullname
    "#{firstname.capitalize} #{lastname.capitalize}"
  end

  def slug
    "#{firstname.downcase}_#{lastname.downcase}"
  end

  # About slugs: the Rails recommended way is to always include the ID at the
  # start of the slug. This way everything works out of the box, since everything
  # after the number is ignored and find(id) just works. To implement this,
  # just add a to_param method, like so:

  def to_param
    "#{id}_#{slug}"
  end

  # BUT! We want our slugs to work without the id, so we added the following
  # class method to accomplish that.

  def self.find_by_slug(slug)
    splitname = slug.split('_')
    Author.find_by(firstname: splitname.first.capitalize, lastname: splitname.last.capitalize)
  end

  # This means the resourceful routes WON'T work out of the box with plain slugs, but
  # there's a way to work around that manually (i.e. without using gems to solve the
  # problem magically). Take a look at the changes made on AuthorsController and
  # ArticlesController to see how we're dealing with that.

  # PS: Bear in mind that generating the slug on the fly every time isn't the best way to do it.
  # Ideally a slug should be created as an after_save and stored in the database for consistency.
  # How would you change the code to do that?

end

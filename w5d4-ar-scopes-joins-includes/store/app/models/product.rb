class Product < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :tags

  scope :in_stock, -> { where('quantity_in_stock > 0') }
  scope :out_of_stock, -> { where('quantity_in_stock = 0') }

  scope :search_name, -> (term) { where('name LIKE ?', "%#{term}%") }

  scope :search_description, -> (term) { where('description LIKE ?', "%#{term}%") }

  scope :search_all_the_things, -> (term) {
    where(
      'description LIKE ? OR name LIKE ?',
      "%#{term}%", "%#{term}%"
    )
  }

  scope :recently_added, -> {
    where('created_at > ?', 1.week.ago)
  }

  scope :added_before, -> (date) {
    where('created_at < ?', date)
  }


  validates :name, presence: true
  validates :price, presence: true

  def display_tags
    tags.pluck(:tag)
  end
end

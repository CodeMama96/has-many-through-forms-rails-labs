class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments

  def categories_attributes=(hash)
    category = Category.find_or_create_by(hash.values.first)
    if !category.name.blank?
      self.categories << category
    end
  end

end

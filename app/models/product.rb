class Product < ActiveRecord::Base
  attr_accessible :price, :product_name , :category_id, :pictures_attributes 
  belongs_to :category
  has_many :pictures, :as => :imageable

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
# ensure that there are no line items referencing this product


  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  accepts_nested_attributes_for :pictures

	define_index do
    indexes :product_name, :sortable => true
    indexes :price
    
  end
  def ensure_not_referenced_by_any_line_item
   
    if line_items.count.zero?
       return true
    else
       errors.add(:base, 'Line Items present' )
    return false

    end
  end
end

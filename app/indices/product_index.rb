ThinkingSphinx::Index.define :product, :with => :active_record do
  indexes :product_name, :sortable => true
  indexes :price
  
end

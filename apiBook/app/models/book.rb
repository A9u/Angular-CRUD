class Book
  include Mongoid::Document
  field :name 
  field :author  
  field :isbn
end

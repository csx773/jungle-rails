class Review < ActiveRecord::Base
    belongs_to :product, :user
    
    validates :rating, presence: true
    validates :description, presence: true

end

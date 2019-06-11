class Author < ActiveRecord::Base
    validates :name, presence: :true
    validates :name, uniqueness: true
    validates_length_of :phone_number, is: 10
end

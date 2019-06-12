require 'pry'
class MyValidator < ActiveModel::Validator
    def validate(record)
        unless record[:title] != "True Facts"
            record.errors[:name] << "Lies"
        end
    end
end

class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 10}
    validates :summary, length: {maximum: 20}
    validates :category, inclusion: {in: ["Fiction"]} 
    validates_with MyValidator

end

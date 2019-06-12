class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :is_click_bait
   
    def is_click_bait
        baity_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        unless !title || baity_titles.any? {|title| self.title.include?(title)}
            errors.add(:title, "not baity enough")
        end
    end

    # def is_click_bait
    #     baity_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    #     if title && !baity_titles.any?{|t| self.title.include?(t)}
    #         errors.add(:title, "not clickbait")
    #     end
    # end
    
end
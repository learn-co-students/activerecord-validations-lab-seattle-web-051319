class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 10}
    validates :summary, length: {maximum: 30}
    validates :category, inclusion: {in: %w(Fiction Non_Fiction)}
    validate :title_name



    def title_name
        @click_bait = ["Won't Believe", "Secret", "Top[number]"]
        unless self.title.to_s.include?("Won't Believe") || self.title.to_s.include?("Secret") || self.title.to_s.include?("Top[number]")
            errors.add(:title, "too clickbaity")
        end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 10}
    validates :summary, length: {maximum: 100}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait

    private 
    def clickbait
        words = ["Won't Believe", "Secret", "Top ", "Guess"]
        clickbait = []

        words.each do |word|
            if self.title.to_s.include?(word)
            else
                clickbait << word
            end
        end 
        if clickbait == words
            errors.add(:title, "This is not clickbaity enough!")
        end
        
    end
    
end

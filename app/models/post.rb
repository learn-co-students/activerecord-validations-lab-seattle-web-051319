class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, uniqueness: false
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait

  def is_clickbait
    clickbait = ["Won't", "Believe", "Secret", "Top", "Guess"]
    if title.present? && title.split(" ").all? { |word| clickbait.exclude?(word)}
      errors.add(:title, "is not clickbaity enough!")
    end
  end
end

class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.to_s.include?("Won't Believe") || record.title.to_s.include?("Secret") || record.title.to_s.include?("Top") || record.title.to_s.include?("Guess")
      record.errors[:title] << 'Needs more clickbait please!'
    end
  end

end

class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /(Won't Believe|Secret|Top \d|Guess)/
      record.errors[attribute] << ("Not a clickbait title")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 15}
  validates :summary, length: {maximum: 50}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
end

class Post < ApplicationRecord
    validates :title,presence:true
    validates :content,length: {minimum:250}
    validates :summary,length: {maximum:250}
    validates :category,inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_have
    CLICKBAIT= [
    "Won't Believe",
    "Secret",
    "Top[number]",
    "Guess"
]

def title_have
    if title.present? &&  CLICKBAIT.none? {|p| title.match(p)}
        errors.add(:title, "title not clickbait-y ")
    end
end
 

end

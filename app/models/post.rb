class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :title_is_clickbait

    def title_is_clickbait
        unless title.present? && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, 'This title is not clickbait-y')
        end
    end
end

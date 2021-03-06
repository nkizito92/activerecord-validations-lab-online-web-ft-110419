class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} This is neither a Fiction or Non-Fiction category"}
    validate :clickbait

    @@pattern = [/Won\'t Believe/, /Secret/, /Top [0-9]/, /Guess/]

    def clickbait
        if @@pattern.none? {|bait| bait.match title}
            errors.add(:title, "This is not clickbait")
        end
    end 
end

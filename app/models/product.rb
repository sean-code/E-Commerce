class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        self.reviews.create(user: user, star_rating: star_rating, comment: comment) #takes a User (an instance of the User class), a star_rating (integer), and a comment (string) as arguments, and creates a new Review in the database associated with this Product and the User
    end

    def print_all_reviews 
        self.reviews.each do |revi|
            puts "Review for #{revi.product.name} by #{revi.user.name}: #{revi.star_rating}. #{revi.comment}" #puts to the terminal a string representing each review for this product
        end
    end

    def average_rating
        self.reviews.average(:star_rating) #returns a float representing the average star rating for all reviews for this product
    end

end
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
        if self.reviews.count == 0
          return  0
        else
           sum = 0
           self.reviews.each do |review|
              sum += review.star_rating
           end
        return sum / self.reviews.count
    end

end
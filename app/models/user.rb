class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews
    
    # def all_reviews
    #     self.reviews.all 
    # end

    # def all_products
    #     self.products.all
    # end

    def remove_reviews(product)
        self.find(product_id).reviews.destroy_all
    end

    def favorite_product
        self.reviews.all.sort{ |one,two| one.star_rating <=> two.star_rating }.last #returns the product instance that has the highest star rating from this user
    end
end
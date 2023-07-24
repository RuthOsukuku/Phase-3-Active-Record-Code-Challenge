class Product < ActiveRecord::Base
  # ...

  def leave_review(user, star_rating, comment)
    reviews.create(user: user, star_rating: star_rating, comment: comment)
  end

  def print_all_reviews
    reviews.each(&:print_review)
  end

  def average_rating
    reviews.average(:star_rating).to_f
  end
end

class User < ActiveRecord::Base
  # ...

  def favorite_product
    reviews.order(star_rating: :desc).first&.product
  end

  def remove_reviews(product)
    reviews.where(product: product).destroy_all
  end
end

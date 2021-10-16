class Post < ApplicationRecord

   attachment :image
   belongs_to :user
   has_many :post_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :favorited_users, through: :favorites, source: :user
   
   validates :prefecture, presence: true
   validates :city, presence: true
   validates :title, presence: true
   validates :content, presence: true
   validates :image, presence: true

   def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
   end
   
   def self.search(keyword)
    where(["prefecture like? OR city like?", "%#{keyword}%", "%#{keyword}%"])
   end
  
end

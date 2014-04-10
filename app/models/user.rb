 class User < ActiveRecord::Base
  has_many :posts
  has_many :tags
  has_secure_password

  validates :email, :uniqueness => true, :presence => true
  validates :name, :presence => true

  def posts_of_me
    selfies = []

    self.tags.each do |tag|
      selfies << tag.post
    end
    selfies
  end
end

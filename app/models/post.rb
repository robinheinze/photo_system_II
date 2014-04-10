class Post < ActiveRecord::Base
  has_many :tags
  belongs_to :user

  has_attached_file :photo, :styles => { :small => "150x150>", :medium => "300x300>", :large => "400x400>"},
      :url => "/assets/posts/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"

  validates_attachment :photo, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }, size: {less_than: 5.megabytes}

end

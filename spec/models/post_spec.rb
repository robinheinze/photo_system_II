require 'spec_helper'

describe Post do
  describe 'tagged_users' do
    it 'returns an array of all tagged users in a post' do
      user1 = User.create(:name => "Robin", :email => "robin4@robin.com", :password => "123", :password_confirmation => "123")
      user2 = User.create(:name => "Tara", :email => "tara4@tara.com", :password => "123", :password_confirmation => "123")
      user3 = User.create(:name => "Ben", :email => "ben4@ben.com", :password => "123", :password_confirmation => "123")
      post_robin = user1.posts.create(:title => "Post")
      tag1 = Tag.create(:user_id => user2.id, :post_id => post_robin.id)
      tag2 = Tag.create(:user_id => user3.id, :post_id => post_robin.id)
      post_robin.tagged_users.should eq [user2, user3]
    end
  end
end

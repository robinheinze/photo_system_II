require 'spec_helper'

describe User do
  describe 'posts_of_me' do
    it 'returns an array of posts in which the user has been tagged' do
      user1 = User.create(:name => "Robin", :email => "robin3@robin.com", :password => "123", :password_confirmation => "123")
      user2 = User.create(:name => "Tara", :email => "tara3@tara.com", :password => "123", :password_confirmation => "123")
      user3 = User.create(:name => "Ben", :email => "ben3@ben.com", :password => "123", :password_confirmation => "123")
      post_robin = user1.posts.create(:title => "Post")
      post_tara = user2.posts.create(:title => "Post")
      post_ben = user3.posts.create(:title => "Post")
      tag1 = Tag.create(:user_id => user2.id, :post_id => post_robin.id)
      tag2 = Tag.create(:user_id => user2.id, :post_id => post_tara.id)
      tag3 = Tag.create(:user_id => user2.id, :post_id => post_ben.id)
      user2.posts_of_me.should eq [post_robin, post_tara, post_ben]
    end
  end

end

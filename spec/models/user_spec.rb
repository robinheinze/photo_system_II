require 'spec_helper'

describe User do
  describe 'posts_of_me' do
    it 'returns an array of posts in which the user has been tagged' do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      user3 = FactoryGirl.create(:user)
      post_robin = FactoryGirl.create(:post, :user_id => user1.id)
      post_tara = FactoryGirl.create(:post, :user_id => user1.id)
      post_ben = FactoryGirl.create(:post, :user_id => user1.id)
      tag1 = Tag.create(:user_id => user2.id, :post_id => post_robin.id)
      tag2 = Tag.create(:user_id => user2.id, :post_id => post_tara.id)
      tag3 = Tag.create(:user_id => user2.id, :post_id => post_ben.id)
      user2.posts_of_me.should eq [post_robin, post_tara, post_ben]
    end
  end
end

require 'spec_helper'

describe Post do
  describe 'tagged_users' do
    it 'returns an array of all tagged users in a post' do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      user3 = FactoryGirl.create(:user)
      post_robin = FactoryGirl.create(:post, :user_id => user1.id)
      tag1 = Tag.create(:user_id => user2.id, :post_id => post_robin.id)
      tag2 = Tag.create(:user_id => user3.id, :post_id => post_robin.id)
      post_robin.tagged_users.should eq [user2, user3]
    end
  end
end

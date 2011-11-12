require 'spec_helper'

describe User do
  it { should accept_values_for(:username, "janedoe", "jd", "jd23", "j_d") }
  it { should_not accept_values_for(:username, "j", "jane doe", "", nil) }
  it "should have unique usernames" do
    user1 = Factory(:user)
    user2 = Factory.build(:user, :username => user1.username)
    user2.save
    user2.should_not be_valid
  end

  describe "find_for_database_authentication" do
    let (:user) { Factory(:user) }
    let (:conditions) { {:login => user.username} }
    it "should find by username" do
      User.find_for_database_authentication(conditions).should == user
    end
    let (:conditions) { {:login => user.email} }
    it "should find by email address" do
      User.find_for_database_authentication(conditions).should == user
    end
  end
end

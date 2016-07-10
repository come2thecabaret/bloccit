require 'rails_helper'


 RSpec.describe User, type: :model do
   let(:user) { create(:user) }
   it { is_expected.to have_many(:posts) }
   it { is_expected.to have_many (:comments) }
   it { is_expected.to have_many (:votes) }
   it { is_expected.to have_many(:favorites) }
   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_length_of(:name).is_at_least(1) }

   it "responds to role" do
  expect(user).to respond_to(:role)
end

it "responds to admin?" do
  expect(user).to respond_to(:admin?)
end

it "responds to member?" do
  expect(user).to respond_to(:member?)
end


describe "role" do
it "is member by default" do
  expect(user.role).to eq("member")
end

context "member user" do
  it "returns true for #member?" do
    expect(user.member?).to be_truthy
  end

  it "returns false for #admin?" do
    expect(user.admin?).to be_falsey
  end
end

context "admin user" do
  before do
    user.admin!
  end

  it "returns false for #member?" do
    expect(user.member?).to be_falsey
  end

  it "returns true for #admin?" do
    expect(user.admin?).to be_truthy
  end
end
end
describe "#favorite_for(post)" do
  before do
    topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
    @post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
  end

  it "returns `nil` if the user has not favorited the post" do
# #1
    expect(user.favorite_for(@post)).to be_nil
  end

  it "returns the appropriate favorite if it exists" do
# #2
    favorite = user.favorites.where(post: @post).create
# #3
    expect(user.favorite_for(@post)).to eq(favorite)
  end
end
describe ".avatar_url" do
 # #6
     let(:known_user) { create(:user, email: "blochead@bloc.io") }

     it "returns the proper Gravatar url for a known email entity" do
 # #7
       expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
 # #8
       expect(known_user.avatar_url(48)).to eq(expected_gravatar)
     end
   end
 end

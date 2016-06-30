require 'rails_helper'


 RSpec.describe User, type: :model do
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

   it { is_expected.to have_many(:posts) }

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
end

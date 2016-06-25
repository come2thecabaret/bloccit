require 'rails_helper'

RSpec.describe Topic, type: :model do

  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:public) { true }
  let(:my_topic) { Topic.create!(name: name, description: description) }

  it { is_expected.to have_many(:posts) }

# #1
  describe "attributes" do
    it "has name, description, and public attributes" do
      expect(my_topic).to have_attributes(name: name, description: description, public: public)
    end

# #2
    it "is public by default" do
      expect(my_topic.public).to be(true)
    end
  end
  


end

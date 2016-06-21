require 'rails_helper'

RSpec.describe Topic, type: :model do

  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:public) { true }
  let(:topic) { Topic.create!(name: name, description: description) }

  it { is_expected.to have_many(:posts) }

# #1
  describe "attributes" do
    it "has name, description, and public attributes" do
      expect(topic).to have_attributes(name: name, description: description, public: public)
    end

# #2
    it "is public by default" do
      expect(topic.public).to be(true)
    end
  end
  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_topic.id}
      expect(response).to render_template :edit
    end

    it "assigns topic to be updated to @topic" do
      get :edit, {id: my_topic.id}
      topic_instance = assigns(:topic)

      expect(topic_instance.id).to eq my_topic.id
      expect(topic_instance.name).to eq my_topic.name
      expect(topic_instance.description).to eq my_topic.description
    end
  end

end

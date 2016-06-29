require 'rails_helper'


 RSpec.describe User, type: :model do
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

   it { is_expected.to have_many(:posts) }

   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_length_of(:name).is_at_least(1) }
end

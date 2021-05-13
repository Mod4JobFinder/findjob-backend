require 'rails_helper'

RSpec.describe SavedJob, type: :model do
    describe "relationship" do
        it { should belong_to(:user) } 
    end

    describe "validations" do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:company) }
        it { should validate_presence_of(:location) }
        it { should validate_presence_of(:url) }
    end
end

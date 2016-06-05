require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password)}
    it { should validate_uniqueness_of(:username)}
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "user name can't be nill" do
    user = User.new(name: nil)
    user.save
    expect(user).not_to be_valid
  end

end

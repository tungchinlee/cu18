# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it "user name can't be nill" do
    user = User.new(name: nil)
    user.save
    expect(user).not_to be_valid
  end

  it 'user has many tasks' do
    user = User.create(name: 'u1')
    task1 = Task.create(title: 't1', user_id: user.id)
    task2 = Task.create(title: 't2', user_id: user.id)
    expect(user.tasks).to include(task1, task2)
  end
end

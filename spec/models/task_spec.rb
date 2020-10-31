require 'rails_helper'

RSpec.describe Task, type: :model do
  it "task belongs to user" do
    user = User.create(name: "u1")
    task = Task.create(title: "t1", user_id: user.id)
    expect(user.tasks).to include(task) 
  end
end

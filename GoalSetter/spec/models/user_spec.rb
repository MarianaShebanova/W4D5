require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it { should validate_length_of(:password).is_at_least(6) }

  subject(:fred) { User.create(username: "fred", password: "123456")}
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:session_token) }

  it { should have_many(:goals) }
  #it { should have_many(:comments) }

  user = User.create(username: "fred", password: "123456")
  it 'finds the user credentials' do
    # user = User.find_by(username: "bob")
    expect(User.find_by_credentials("fred", "123456").username).to eq(user.username)
  end
end

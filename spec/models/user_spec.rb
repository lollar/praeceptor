require 'rails_helper'

describe 'User' do
  context 'initialization' do
    specify { expect(User.new).to be_an_instance_of(User) }
  end
end

require 'rails_helper'

describe ProjectForm do
  context 'form can be initialized' do
    specify { expect(ProjectForm.new).to be_an_instance_of(ProjectForm) }
  end
end


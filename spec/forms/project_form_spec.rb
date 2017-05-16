require 'rails_helper'

describe ProjectForm, type: :model  do
  let(:project) { ProjectForm.new(title: 'Test', requirements: '...', skill_level: 'junior') }

  context 'form can be initialized' do
    specify { expect(ProjectForm.new).to be_an_instance_of(ProjectForm) }
  end

  context 'form validations' do 
    specify { expect(project).to be_valid }
    specify { is_expected.to validate_presence_of(:title) }
    specify { is_expected.to validate_presence_of(:requirements) }
  end
end


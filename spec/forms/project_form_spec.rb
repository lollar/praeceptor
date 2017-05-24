require 'rails_helper'

describe ProjectForm, type: :model  do
  let(:project) { ProjectForm.new(title: 'Test', requirements: '...', skill_level: 'junior') }

  context '#self.valid?' do
    let(:valid_project)   { Project.new(title: 'Test', requirements: 'Test Requirements', skill_level: 'senior') }
    let(:invalid_project) { Project.new(title: nil, requirements: 'You need a title bruh!') }

    specify { expect(described_class.valid?(valid_project)).to be_truthy }
    specify { expect(described_class.valid?(invalid_project)).to be_falsey }
  end

  context 'form can be initialized' do
    specify { expect(ProjectForm.new).to be_an_instance_of(ProjectForm) }
  end

  context 'form validations' do 
    specify { expect(project).to be_valid }
    specify { is_expected.to validate_presence_of(:title) }
    specify { is_expected.to validate_presence_of(:requirements) }
  end
end


# require 'spec_helper'
require 'rails_helper'
describe Project do
  context 'initialization' do
    specify { expect(Project.new).to be_a(Project) }
  end

  context 'testing database constraints' do
    specify { expect { Project.create!() }.to raise_error(ActiveRecord::NotNullViolation) }
    specify { expect { Project.create!(title: 'Test Project') }.to raise_error(ActiveRecord::NotNullViolation) }
    specify { expect { Project.create!(title: 'Test', requirements: 'All the tests', skill_level: 'wrong') }.to raise_error(ActiveRecord::StatementInvalid) }
  end

  context 'successfully create a new Project' do
    let(:project) { Project.new(title: 'Test', requirements: 'test') }
    let(:project2) { Project.new(title: 'Test', requirements: 'test', skill_level: 'senior') }

    specify { expect(project.save).to be_truthy }
    specify { expect(project.skill_level).to eq 'novice' }
    specify { expect { project2.save! }.not_to raise_error }
    specify { expect(project2.skill_level).to eq 'senior' }
  end
end

# require 'spec_helper'
require 'rails_helper'
describe Project do
  context 'initialization' do
    specify { expect(Project.new).to be_a(Project) }
  end

  context 'database validations' do
    project = Project.new
    it { expect { project.save! }.to raise_error(ActiveRecord::NotNullViolation) }
  end
end

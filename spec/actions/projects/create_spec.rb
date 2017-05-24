require 'rails_helper'

describe Projects::Create do
  let(:valid_attributes) {{ title: 'Valid Title', requirements: 'A list of different requirements' }}
  let(:invalid_attributes) {{ title: nil, requirements: 'Hey dude, you really need a title.'  }}
  
  subject { described_class }

  context '#run successfully creates a new project' do
    let(:result) { subject.run(valid_attributes) }

    specify { expect(result).to be_successful }
    specify { expect(result.message).to match(/success/i) }
    specify { expect(result.object).to be_an_instance_of(Project) }
    specify { expect(result.object).to be_valid }
    specify { expect(result.object).to be_persisted }
  end

  context '#run fails to complete but does not raise exception' do
    let(:result) { subject.run(invalid_attributes) }

    specify { expect(result).not_to be_successful }
    specify { expect(result).to be_failed }
    specify { expect(result.message).to match(/can\'t be blank/i) }
    specify { expect(result.object).to be_an_instance_of(Project) }
    specify { expect(result.object).not_to be_persisted }    
  end
end

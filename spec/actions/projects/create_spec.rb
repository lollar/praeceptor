require 'rails_helper'

describe Projects::Create do
  let(:valid_attributes) {{ title: 'Valid Title', requirements: 'A list of different requirements' }}
  let(:invalid_attributes) {{ title: nil, requirements: 'Hey dude, you really need a title.'  }}
  
  subject { described_class }

  context '#run successfully creates a new project' do
    let(:result) { subject.run(valid_attributes) }

    it { expect(result).to be_successful }
    it { expect(result.message).to match(/success/i) }
    it { expect(result.object).to be_an_instance_of(Project) }
    it { expect(result.object).to be_valid }
    it { expect(result.object).to be_persisted }
  end

  context '#run fails to complete but does not raise exception' do
    let(:result) { subject.run(invalid_attributes) }

    it { expect(result).not_to be_successful }
    it { expect(result).to be_failed }
    it { expect(result.message).to match(/blah/) }
    it { expect(result.object).to be_an_instance_of(Project) }
    it { expect(result.object).not_to be_valid }
    it { expect(result.object).not_to be_persisted }    
  end
end

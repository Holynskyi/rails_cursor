require 'rails_helper'

describe Account do
  let(:account) { build(:account)}

  it { expect(account).to validate_presence_of(:name) }
  it { expect(account).to validate_presence_of(:age) }
  it { expect(account).to validate_length_of(:name).is_at_least(8) }


end



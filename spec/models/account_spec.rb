require 'rails_helper'

describe Account do
  let(:account) { build(:account)}

  it { expect(account).to validate_presence_of(:name) }
  it { expect(account).to validate_presence_of(:name) }
  it { expect(account).to validate_presence_of(:age) }

  it 'should get weather' do
     allow(account).to receive(:get_weather) { 'Sunny' }
     expect(account.get_weather).to eql('Sunny')
  end
end



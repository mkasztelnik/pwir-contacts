require 'rails_helper'

RSpec.describe Contact do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it 'refuse invalid email' do
    contact = build(:contact, email: 'invalid.email.pl')

    expect(contact.valid?).to be_falsy
  end
end

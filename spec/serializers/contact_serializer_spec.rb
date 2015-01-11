require 'rails_helper'

RSpec.describe ContactSerializer do
  it 'serialize all contact fields' do
    contact = build(:contact, id: 123)
    serializer = described_class.new(contact)

    result = JSON.parse(serializer.to_json)

    expect(result['contact']['id']).to eq contact.id
    expect(result['contact']['first_name']).to eq contact.first_name
    expect(result['contact']['last_name']).to eq contact.last_name
    expect(result['contact']['email']).to eq contact.email
    expect(result['contact']['telephone']).to eq contact.telephone
    expect(result['contact']['address']).to eq contact.address
  end
end

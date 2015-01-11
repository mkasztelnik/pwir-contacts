require 'rails_helper'

RSpec.describe Api::V1::ContactsController do
  context 'GET /contacts' do
    it 'returns all contacts' do
      c1 = create(:contact)
      c2 = create(:contact)

      get :index

      expect(response).to have_http_status(:ok)
      expect(assigns(:contacts)).to eq([c1, c2])
    end
  end

  context 'GET /contacts/:id' do
    it 'returns existing contact' do
      contact = create(:contact)

      get :show, id: contact.id

      expect(response).to have_http_status(:ok)
      expect(assigns(:contact)).to eq(contact)
    end

    it 'throws 404 (Not Found) when contact does not exist' do
      get :show, id: -123

      expect(response).to have_http_status(:not_found)
    end
  end

  context 'POST /contacts' do
    it 'creates new contact' do
      expect { post :create, contact: new_contact_req }.
        to change { Contact.count }.by 1
      expect(response).to have_http_status(:created)
    end

    it 'returns 422 (Unprocessable Entity) when contact is not valid' do
      invalid_contact = build(:contact, first_name: nil)

      expect { post :create, contact: new_contact_req(invalid_contact) }.
        to change { Contact.count }.by 0
      expect(response).to have_http_status(:unprocessable_entity)
    end

    def new_contact_req(contact = build(:contact))
      {
        first_name: contact.first_name,
        last_name: contact.last_name,
        email: contact.email,
        telephone: contact.telephone,
        address: contact.address,
      }
    end
  end

  context 'PUT /contacts/:id' do
    it 'updated existing contact' do
      contact = create(:contact)

      put :update, id: contact.id, contact: { first_name: 'updated name' }
      contact.reload

      expect(response).to have_http_status(:ok)
      expect(contact.first_name).to eq 'updated name'
    end

    it 'returns 404 (Not Found) when record is not found' do
      put :update, id: -123, contact: { first_name: 'updated name' }

      expect(response).to have_http_status(:not_found)
    end
  end

  context 'DELETE /contacts/:id' do
    it 'deletes existing contact' do
      contact = create(:contact)

      delete :destroy, id: contact.id

      expect(response).to have_http_status(:no_content)
    end

    it 'returns 404 (Not Found) when record is not found' do
      delete :destroy, id: -123

      expect(response).to have_http_status(:not_found)
    end
  end
end

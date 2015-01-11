module Api
  module V1
    class ContactsController < ApplicationController
      before_filter :find_contact, except: [:index, :create]

      def index
        @contacts = Contact.all
        render json: @contacts
      end

      def show
        render json: @contact
      end

      def create
        @contact = Contact.create!(contact_params)
        render json: @contact, status: :created
      end

      def update
        @contact.update_attributes!(contact_params)
        render json: @contact
      end

      def destroy
        @contact.destroy!
        head :no_content
      end

      private

      def find_contact
        @contact = Contact.find(params[:id])
      end

      def contact_params
        params.require(:contact)
          .permit(:first_name, :last_name, :email, :telephone, :address)
      end
    end
  end
end

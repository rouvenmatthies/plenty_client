module PlentyClient
  module Account
    module Contact
      class Bank
        include PlentyClient::Endpoint
        include PlentyClient::Request

        LIST_A_CONTACT_PAYMENTS   = '/accounts/contacts/{contactId}/banks'.freeze
        FIND_A_CONTACT_PAYMENT    = '/accounts/contacts/banks/{contactBankId}'.freeze
        CREATE_A_CONTACT_PAYMENT  = '/accounts/contacts/banks'.freeze
        UPDATE_A_CONTACT_PAYMENT  = '/accounts/contacts/banks/{contactBankId}'.freeze
        DELETE_A_CONTACT_PAYMENT  = '/accounts/contacts/banks/{contactBankId}'.freeze

        class << self
          def list(contact_id, headers = {}, &block)
            get(build_endpoint(LIST_A_CONTACT_PAYMENTS, contact: contact_id), headers, &block)
          end

          def find(contact_bank_id, headers = {}, &block)
            get(build_endpoint(FIND_A_CONTACT_PAYMENT, contact_bank: contact_bank_id), headers, &block)
          end

          def create(body = {})
            post(CREATE_A_CONTACT_PAYMENT, body)
          end

          def update(contact_bank_id, body = {})
            put(build_endpoint(UPDATE_A_CONTACT_PAYMENT, contact_bank: contact_bank_id), body)
          end

          def destroy(contact_bank_id, body = {})
            delete(build_endpoint(DELETE_A_CONTACT_PAYMENT, contact_bank: contact_bank_id), body)
          end
        end
      end
    end
  end
end

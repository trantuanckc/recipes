require 'swagger_helper'

RSpec.describe 'api/converts', type: :request do
  path '/api/converts' do
    post 'Weigt converter' do
      tags 'convert'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          convert: {
            type: :object,
            properties: {
              amount: {
                type: :integer,
                example: 10
              },

              from: {
                type: :string,
                example: 'kilogram'
              },

              to: {
                type: :string,
                example: 'gram'
              }
            }
          }
        }
      }
      response '200', 'convert' do
        examples 'application/json' => {
          'result' => 'string',
          'error_message' => 'string'
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" } # rubocop:disable RSpec/VariableName
        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end

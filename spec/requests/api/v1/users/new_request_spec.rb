require 'rails_helper'

RSpec.describe 'Users New API', type: :request do
  describe 'new user' do
    describe 'happy path' do
      it 'creates a user' do
        user_params = ({ 
                        name: 'Harry Potter',
                        email: 'harry.potter@hogwarts.com'
                      })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
        
        expect(response).to be_successful
        expect(response.status).to eq(201)

        user_response = JSON.parse(response.body, symbolize_names: true)

        expect(user_response).to have_key(:data)
        expect(user_response[:data]).to be_a(Hash)
        expect(user_response[:data]).to have_key(:id)
        expect(user_response[:data][:id]).to be_a(String)

        expect(user_response[:data]).to have_key(:attributes)
        expect(user_response[:data][:attributes]).to be_a(Hash)
        expect(user_response[:data][:attributes]).to have_key(:name)
        expect(user_response[:data][:attributes]).to have_key(:email)
        expect(user_response[:data][:attributes]).to have_key(:api_key)

        new_user = User.last

        expect(new_user.name).to eq(user_params[:name])
        expect(new_user.email).to eq(user_params[:email])
      end
    end

    describe 'sad path' do
      it 'validates uniqueness of user email' do
        User.create!(name: "billy", email: "b@email.com", api_key: "adfswoqdoq2e3")

        user_params = ({ 
                        name: 'Harry Potter',
                        email: 'b@email.com'
                      })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        user_response = JSON.parse(response.body, symbolize_names: true)
        
        expect(user_response).to have_key(:error)
        expect(user_response[:error]).to be_a(Array)
        expect(user_response[:error][0]).to have_key(:title)
        expect(user_response[:error][0][:title]).to eq("Validation failed: Email has already been taken")

        expect(user_response[:error][0]).to have_key(:status)
        expect(user_response[:error][0][:status]).to eq(400)
      end

      it 'validates presence of name' do

        user_params = ({ 
                        name: '',
                        email: 'a@email.com'
                      })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        user_response = JSON.parse(response.body, symbolize_names: true)
        
        expect(user_response).to have_key(:error)
        expect(user_response[:error]).to be_a(Array)
        expect(user_response[:error][0]).to have_key(:title)
        expect(user_response[:error][0][:title]).to eq("Validation failed: Name can't be blank")

        expect(user_response[:error][0]).to have_key(:status)
        expect(user_response[:error][0][:status]).to eq(400)
      end

      it 'validates presence of email' do

        user_params = ({ 
                        name: 'Jared West',
                        email: ''
                      })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        user_response = JSON.parse(response.body, symbolize_names: true)
        
        expect(user_response).to have_key(:error)
        expect(user_response[:error]).to be_a(Array)
        expect(user_response[:error][0]).to have_key(:title)
        expect(user_response[:error][0][:title]).to eq("Validation failed: Email can't be blank")

        expect(user_response[:error][0]).to have_key(:status)
        expect(user_response[:error][0][:status]).to eq(400)
      end
    end
  end
end
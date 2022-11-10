require 'swagger_helper'

RSpec.describe 'videogames', type: :request do

  path '/videogames' do

    get('list videogames') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create videogame') do

      consumes 'application/json'
      parameter name: :videogame, in: :body, schema: model_to_post_schema(Videogame)

      response(200, 'successful') do

        after do |example|

          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/videogames/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    put('update videogame') do

      consumes 'application/json'
      parameter name: :videogame, in: :body, schema: model_to_post_schema(Videogame)

      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end

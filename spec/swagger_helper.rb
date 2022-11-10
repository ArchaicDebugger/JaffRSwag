# frozen_string_literal: true

require 'rails_helper'

def model_to_schema model
  {
    type: :object,
    properties: model.columns.each_with_object({}) do |column, hash|
      hash[column.name] = { type: column.type, nullable: column.null }
    end,
    required: model.columns.reject(&:null).map(&:name)
  }
end

def model_to_post_schema model
  columns_to_omit = %w[id created_at updated_at]
  {
    type: :object,
    properties: model.columns.each_with_object({}) do |column, hash|
      hash[column.name] = { type: column.type, nullable: column.null } unless columns_to_omit.include?(column.name)
    end
  }
end


RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  models_to_swaggerize = [
    Videogame,
    Developer
  ]

  swaggerize_schemas = models_to_swaggerize.each_with_object({}) do |model, hash|
    hash[model.name.downcase] = model_to_schema(model)
  end

  puts swaggerize_schemas.to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'localhost:3000'
            }
          }
        }
      ],
      components: {
        schemas: swaggerize_schemas
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end

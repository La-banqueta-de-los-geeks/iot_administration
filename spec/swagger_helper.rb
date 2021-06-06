# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

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
      components: {
        securityDefinitions: {
          client: {
            in: :header,
            name: :Authorization,
            type: 'http',
            require: true,
            description: 'Bearer Token',
            flow: 'application'
          }
        },
        securitySchemes: {
          Bearer: {
            description: 'Bearer user token key necessary to use API calls',
            type: :apiKey,
            name: 'Authorization',
            in: :header
          }
        },
        schemas: {
          user: {
            type: 'object',
            properties: {
              email: { type: 'string', required: true },
              password: { type: 'string', required: true },
              organization_attributes: {
                type: 'object',
                properties: {
                  name: { type: 'string', required: true }
                }
              }
            },
            example: {
              user: {
                email: 'test@test.com',
                password: '123456',
                organization_attributes: {
                  name: 'test'
                }
              }
            }
          },
          user_login: {
            type: 'object',
            properties: {
              email: { type: 'string', required: true },
              password: { type: 'string', required: true }
            },
            example: {
              user: {
                email: 'test@test.com',
                password: '123456'
              }
            }
          },
          device: {
            type: 'object',
            properties: {
              name: { type: 'string', required: true },
              status: { type: 'string', required: true }
            },
            example: {
              device: {
                name: 'Example Device',
                status: 'ON'
              }
            }
          },
          device_port: {
            type: 'object',
            properties: {
              port: { type: 'integer', required: true },
              status: { type: 'string', required: true }
            },
            example: {
              device_port: {
                port: 1,
                status: 'ON'
              }
            }
          },
          device_ports: {
            type: 'array',
            collectionFormat: 'multi',
            items: {
              type: 'object',
              properties: {
                port: { type: 'integer', required: true },
                status: { type: 'string', required: true }
              }
            },
            example: {
              device_ports: [
                {
                  port: 1,
                  status: 'ON'
                }
              ]
            }
          }
        }
      },
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'localhost:4000'
            }
          }
        }
      ]
    }

  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end

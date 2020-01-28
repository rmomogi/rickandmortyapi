# frozen_string_literal: true

module V1
  class Base < Grape::API
    prefix 'api/v1'
    format :json

    mount Characters
  end
end

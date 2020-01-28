# frozen_string_literal: true

module V1
  class Characters < Grape::API
    desc 'End-points Rick and Morty API - Characters'
    namespace :characters do
      desc 'Find person by id'
      params do
        requires :id, type: String, desc: 'ID'
      end
      get do
        ::CharacterJob.perform_now params['id']
      end
    end
  end
end

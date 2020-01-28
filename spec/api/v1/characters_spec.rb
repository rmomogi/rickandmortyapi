# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Characters' do
  describe '#GET api/v1/characters' do
    describe 'when character exists' do
      before do
        allow_any_instance_of(Rickmorty::Episode).to receive(:by_id).and_return(episode_response)
        allow_any_instance_of(Rickmorty::Character).to receive(:by_id).and_return(character_response)
        get '/api/v1/characters', params: { 'id': character_response['id'] }
      end

      let(:character_response) do
        { 'id' => 1,
          'name' => 'Rick Sanchez',
          'status' => 'Alive',
          'species' => 'Human',
          'episode' => ['https://rickandmortyapi.com/api/episode/1'],
          'url' => 'https://rickandmortyapi.com/api/character/1',
          'created' => '2017-11-04T18:48:46.250Z' }
      end

      let(:episode_response) do
        { 'id' => 1,
          'name' => 'Pilot',
          'air_date' => 'December 2, 2013',
          'episode' => 'S01E01',
          'characters' => [],
          'url' => 'https://rickandmortyapi.com/api/episode/1',
          'created' => '2017-11-10T12:56:33.798Z' }
      end

      it 'sucess' do
        expect(response.status).to eq 200
      end

      it 'return character name' do
        json = JSON.parse response.body
        expect(json['name']).to eq character_response['name']
      end
    end

    describe 'when character not exists' do
      before do
        allow_any_instance_of(Rickmorty::Episode).to receive(:by_id).and_return(episode_response)
        allow_any_instance_of(Rickmorty::Character).to receive(:by_id).and_return(character_response)
        get '/api/v1/characters', params: { 'id': character_response['id'] }
      end

      let(:character_response) do
        { 'error' => 'Character not found' }
      end

      let(:episode_response) do
        { 'error' => 'Episode not found' }
      end

      it 'sucess' do
        expect(response.status).to eq 200
      end

      it 'return error' do
        json = JSON.parse response.body
        expect(json['error']).to eq character_response['error']
      end
    end
  end
end

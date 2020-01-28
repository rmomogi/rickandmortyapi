# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character, type: :model do
  subject(:character) { described_class.new }
  before do
    allow_any_instance_of(Rickmorty::Episode).to receive(:by_id).and_return(episode_response)
    allow_any_instance_of(Rickmorty::Character).to receive(:by_id).and_return(character_response)
  end

  describe 'when character exists' do
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

    it 'return data' do
      expect(character.find_by_id(1)['air_date']).to eq episode_response['air_date']
    end
  end

  describe 'when character not exists' do
    let(:episode_response) do
      { 'error' => 'Episode not found' }
    end

    let(:character_response) do
      { 'error' => 'Character not found' }
    end

    before do
      allow_any_instance_of(Rickmorty::Episode).to receive(:by_id).and_return(episode_response)
      allow_any_instance_of(Rickmorty::Character).to receive(:by_id).and_return(character_response)
    end

    it 'return error' do
      expect(character.find_by_id(9999)['error']).to eq character_response['error']
    end

    it 'return air date nil' do
      expect(character.find_by_id(9999)['air_date']).to be_nil
    end
  end
end

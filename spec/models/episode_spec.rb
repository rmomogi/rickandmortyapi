# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Episode, type: :model do
  subject(:episode) { described_class.new }

  describe 'when episode exists' do
    let(:response) do
      { 'id' => 1,
        'name' => 'Pilot',
        'air_date' => 'December 2, 2013',
        'episode' => 'S01E01',
        'characters' => [],
        'url' => 'https://rickandmortyapi.com/api/episode/1',
        'created' => '2017-11-10T12:56:33.798Z' }
    end

    it 'return data' do
      allow_any_instance_of(Rickmorty::Episode).to receive(:by_id).and_return(response)
      expect(episode.find_by_id(1)['name']).to eq response['name']
    end
  end

  describe 'when episode not exists' do
    let(:response) do
      { 'error' => 'Episode not found' }
    end

    it 'return error' do
      allow_any_instance_of(Rickmorty::Episode).to receive(:by_id).and_return(response)
      expect(episode.find_by_id(9999)['error']).to eq response['error']
    end
  end
end

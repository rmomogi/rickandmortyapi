# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe CharacterJob, type: :job do
  subject(:job) { described_class }
  let(:character) { instance_double(Character) }

  describe 'when perform' do
    it 'call Character find_by_id' do
      allow(Character).to receive(:new).and_return(character)
      expect(character).to receive(:find_by_id).with(1)
      job.perform_now 1
    end
  end
end

# frozen_string_literal: true

class CharacterJob < ApplicationJob
  queue_as :high_priority

  def perform(character_id)
    Character.new.find_by_id(character_id)
  end
end

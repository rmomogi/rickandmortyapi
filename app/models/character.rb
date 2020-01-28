# frozen_string_literal: true

class Character
  def initialize
    @character_api = Rickmorty::Character.new
  end

  def find_by_id(id)
    character(id).merge!('air_date' => first_air_date)
  end

  private

  def character(id)
    @character ||= @character_api.by_id(id)
  end

  def episodes
    @character.dig('episode')
  end

  def episode_air_date(id)
    Episode.new.find_by_id(id)
  end

  def first_air_date
    unless episodes.nil?
      episode_air_date(episodes.first.split('/').last)['air_date']
    end
  end
end

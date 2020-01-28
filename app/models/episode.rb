# frozen_string_literal: true

class Episode
  def initialize
    @episode = Rickmorty::Episode.new
  end

  def find_by_id(id)
    @episode.by_id(id)
  end
end

# frozen_string_literal: true

module EventsConcern
  extend ActiveSupport::Concern

  module EventTypes
    LEAGUE = 'league'
    TOURNAMENT = 'tournament'
    ACTION = 'action'

    ALL = [LEAGUE, TOURNAMENT, ACTION].freeze
  end

  private

  def end_after_start
    errors.add(:end_datetime, 'must be after start') if end_datetime.blank? || end_datetime <= start_datetime
  end
end

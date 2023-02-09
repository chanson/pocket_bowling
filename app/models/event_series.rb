# frozen_string_literal: true

class EventSeries < ApplicationRecord
  include EventsConcern

  has_many :events
  has_many :event_series_users
  has_many :users, through: :event_series_users
  has_many :event_participants, through: :event_series_users

  validates :event_series, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validates :team_size, presence: true
  validates :handicap_base, presence: true, allow_nil: true
  validates :handicap_percent, presence: true, if: :handicap_base
  validates :type, presence: true, inclusion: { in: EventTypes::ALL }

  validate :end_after_start
  validate :within_event_series_dates

  private

  def within_event_series_dates
    if start_datetime < event_series.start_datetime
      errors.add(:start_datetime, 'must be at or after the league/tournament start')
    end

    if end_datetime > event_series.end_datetime
      errors.add(:end_datetime, 'must be before or at the league/tournament end')
    end
  end
end

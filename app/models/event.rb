# frozen_string_literal: true

class Event < ApplicationRecord
  include EventsConcern

  # belongs_to :event_series
  has_many :event_series_users, through: :event_series
  has_many :event_participants

  # validates :event_series, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validates :team_size, presence: true
  validates :handicap_base, presence: true, allow_nil: true
  validates :handicap_percent, presence: true, if: :handicap_base
  validates :event_type, presence: true, inclusion: { in: EventTypes::ALL }
  validates :total_games, presence: true, numericality: { greater_than: 0 }

  validate :end_after_start
end

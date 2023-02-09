# frozen_string_literal: true

class EventParticipant < ApplicationRecord
  belongs_to :event
  belongs_to :event_series_user
  belongs_to :event_squad
  has_many :bracket_event_participants
  has_many :bracket_sessions, through: :bracket_event_participants
  has_many :bracket_seeds

  validates :event, presence: true
  validates :event_series_user, presence: true
  validates :event_squad, presence: true
end

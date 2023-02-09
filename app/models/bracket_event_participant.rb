# frozen_string_literal: true

class BracketEventParticipant < ApplicationRecord
  belongs_to :event_participant
  belongs_to :bracket_session
  has_many :bracket_seeds

  validates :bracket_session, presence: true
  validates :event_participant, presence: true
  validates :number_of_brackets, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

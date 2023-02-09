# frozen_string_literal: true

class BracketSeed < ApplicationRecord
  belongs_to :bracket_event_participant
  belongs_to :event_participant
  belongs_to :bracket_session

  validates :bracket_event_participant, presence: true
  validates :event_participant, presence: true
  validates :bracket_session, presence: true
  validates :bracket_number, presence: true, numericality: { greater_than: 0 }, uniqueness: { scope: [:bracket_event_paricipant, :bracket_session] }
  validates :bracket_seed, presence: true, numericality: { greater_than: 0 }
  validate :bracket_seed_valid
  valdiate :bracket_number_valid

  before_validation :set_defaults

  private

  def bracket_seed_valid
    if bracket_seed > bracket_session.size
      errors.add(:bracket_seed, 'must be less than bracket size')
    end
  end

  def bracket_number_valid
    if bracket_number > bracket_session.total_brackets
      errors.add(:bracket_number, 'must be less than the number of brackets')
    end
  end

  def set_defaults
    self.event_participant_id ||= bracket_event_paricipant.event_participant_id

    true
  end
end

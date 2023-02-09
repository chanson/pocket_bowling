# frozen_string_literal: true

class BracketSession < ApplicationRecord
  module BracketTypes
    SCRATCH = 'scratch'
    HANDICAP = 'handicap'

    ALL = [SCRATCH, HANDICAP].freeze
  end

  belongs_to :event
  belongs_to :event_squad
  has_many :bracket_event_participants
  has_many :event_participants, through: :bracket_event_participants
  has_many :bracket_seeds

  validate :event, presence: true
  validate :event_squad, presence: true
  validate :type, presence: true, inclusion: { in: BracketTypes::ALL }
  validate :starting_game, presence: true, numericality: { greater_than: 0 }

  validates :starting_game_valid

  def number_of_games
    Math.log(size, 2)
  end

  private

  # FIXME: number_of_games should be derived by size i think
  # need to add number of games to..event?
  # will need to figure out how to handle events that span  multiple sessions..
  # or maybe not. maybe its just one long squad
  def starting_game_valid
    if starting_game + number_of_games > event.total_games
      errors.add(:base, 'starting game plus number of games must be less than total event games')
    end
  end
end

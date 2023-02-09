# frozen_string_literal: true

class EventSquad < ApplicationRecord
  belongs_to :event

  validates :event, presence: true
  validates :squad_number, presence: true, uniqueness: { scope: :event_id }, numericality: { greater_than: 0 }
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
end

# frozen_string_literal: true

class EventSeriesUser < ApplicationRecord
  belongs_to :event_series
  belongs_to :user

  validate :event_series, presence: true
  validate :user, presence: true

  before_validation :set_defaults

  private

  def set_defaults
    self.email ||= user.email
    self.contact ||= false

    true
  end
end

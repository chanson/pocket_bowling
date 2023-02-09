# frozen_string_literal: true

class Forms::TextFieldComponent < ViewComponent::Base
  def initialize(form:, name:, placeholder:, value: "", id: nil, errors: nil, type: nil, wrapper_class: nil, show_label: false)
    @form = form
    @name = name
    @placeholder = placeholder
    @value = value
    @id = id || name
    @errors = errors
    @type = type
    @wrapper_class = wrapper_class
    @show_label = show_label
  end

  def error_class
    @errors.present? ? 'input-error' : ''
  end

  def error_message
    @errors.join(', ')
  end
end

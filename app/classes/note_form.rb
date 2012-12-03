class NoteForm < ApplicationController
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :title
  attr_reader :content

  attribute :title, String
  attribute :content, String
  attribute :current_user_id, Integer
  attribute :note_id, Integer
  attribute :note, Hash

  validates :title, presence: true
  validates :content, presence: true
  # … more validations …

  # Forms are never themselves persisted
  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

private

  def new?
    if note_id == nil then
      true
    else
      false
    end
  end

  def persist!
    current_user = User.find(current_user_id)
    if new?
      @note = current_user.notes.create!(title: title, content: content)
    else
      @note = current_user.notes.find(note_id)
      @note = @note.update_attributes(title: title, content: content)
    end
  end
end
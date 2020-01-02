# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true, length: { minimum: 4 }
end

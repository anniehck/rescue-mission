class Answer < ActiveRecord::Base
  belongs_to :question
  # belongs_to :user

  validates :description, length: { minimum: 50, too_short: "Answer description must be at least %{count} characters long." }
end

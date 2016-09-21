class Question < ActiveRecord::Base
  # belongs_to :user
  has_many :answers, dependent: :destroy

  validates :title, length: { minimum: 40, too_short: "Title must be at least %{count} characters long." }
  validates :description, length: { minimum: 150, too_short: "Description must be at least %{count} characters long." }
end

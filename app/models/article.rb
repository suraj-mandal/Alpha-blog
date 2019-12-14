class Article < ApplicationRecord
#  rails give us getters and setters for the model -> from the db that we have created
#  perform the validation on the data -> empty validation, -> length validation
  validates :title, presence: true, length: { minimum: 3, maximum: 50}
  validates :description, presence: true, length: { minimum: 10, maximum: 300}
end

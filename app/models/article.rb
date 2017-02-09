class Article < ApplicationRecord
  belongs_to :user

  validates :title, :article, presence: true
end

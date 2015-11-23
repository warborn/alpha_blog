class Article < ActiveRecord::Base
  belongs_to :user
  before_save { self.emal = email.downcase }
  validates :title,       presence: true,
                          length: { minimum: 5, maximum: 50 }
  validates :description, presence: true,
                          length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
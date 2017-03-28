class Favorite < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :micropost_id }, presence: true
  belongs_to :user
  belongs_to :micropost
end

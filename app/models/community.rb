class Community < ApplicationRecord
  extend FriendlyId
  before_save :format_name

  belongs_to :user
  has_many :submissions

  has_many :subscriptions
  has_many :users, through: :subscriptions

  friendly_id :title, use: :slugged

  private

  def format_name
    # the ! after gsub modifies the attribute it's being called on instead of just returning the modified attribute value
    self.name.titleize
    self.name.gsub!(' ', '')
  end
end

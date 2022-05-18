class Community < ApplicationRecord
  belongs_to :user
  has_many :submissions

  before_save :format_name

  private

  def format_name
    # the ! after gsub modifies the attribute it's being called on instead of just returning the modified attribute value
    self.name.titleize
    self.name.gsub!(' ', '')
  end
end

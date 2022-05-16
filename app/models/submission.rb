class Submission < ApplicationRecord
  mount_uploader :submission_image, SubmissionImageUploader
  mount_uploader :submission_video, SubmissionImageUploader

  belongs_to :user
  belongs_to :community

  has_many :comments, dependent: :destroy # destroy the comments related to a given submission if a given submission is destroyed.

  validates :title, presence: true
  validates :body, length: { maximum: 8000 }
  validates :url, url: true, allow_blank: true
end

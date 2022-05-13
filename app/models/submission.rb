class Submission < ApplicationRecord
  mount_uploader :submission_image, SubmissionImageUploader
  mount_uploader :submission_video, SubmissionImageUploader
  belongs_to :user
end

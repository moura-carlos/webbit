class SubmissionMailer < ApplicationMailer
  default from: "notifications@webbit.com"
  def new_response
    @comment = params[:comment]
    @submission = params[:submission]

    if @submission.user.comment_subscription?
      mail to: @submission.user.email, subject: "New response on #{@submission.title}" # targeting the person who own a given submission that was commented on.
    end
  end
end

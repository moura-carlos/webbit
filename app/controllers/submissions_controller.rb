class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[ show edit update destroy upvote downvote]
  before_action :authenticate_user!, except: %i[show index]

  # GET /submissions or /submissions.json
  def index
    if user_signed_in?
      #@submissions = current_user.subscribed_submissions.order("created_at desc")
      @pagy, @submissions = pagy(current_user.subscribed_submissions.order("created_at desc"))
    else
      @pagy, @submissions = pagy(Submission.all)
    end
  end

  # GET /submissions/1 or /submissions/1.json
  def show
    @comment = Comment.new
    @community = @submission.community
  end

  # GET /submissions/new
  def new
    # @submission = Submission.new
    # getting all the submissions of the current user and creating a new instance
    @submission = current_user.submissions.build
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions or /submissions.json
  def create
    #@submission = Submission.new(submission_params)
    @submission = current_user.submissions.build(submission_params)
    respond_to do |format|
      if @submission.save
        format.html { redirect_to submission_url(@submission), notice: "Submission was successfully created." }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1 or /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to submission_url(@submission), notice: "Submission was successfully updated." }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1 or /submissions/1.json
  def destroy
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url, notice: "Submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def upvote
    respond_to do |format|
      unless current_user.voted_for? @submission
        format.html { redirect_back(fallback_location: root_path) }
        format.json { head :no_content }
        format.js { flash.now[:notice] = 'Successfully upvoted submission' }
        @submission.upvote_by current_user
      else
        format.html { redirect_back(fallback_location: root_path) }
        format.json { head :no_content }
        format.js { flash.now[:notice] = 'You already vote this submission' }
      end
    end
  end

  def downvote
    respond_to do |format|
      unless current_user.voted_for? @submission
        format.html { redirect_back(fallback_location: root_path) }
        format.json { head :no_content }
        format.js { flash.now[:notice] = 'Successfully downvoted submission' }
        @submission.downvote_by current_user
      else
        format.html { redirect_back(fallback_location: root_path) }
        format.json { head :no_content }
        format.js { flash.now[:notice] = 'You already vote this submission' }
      end
    end
  end

  def unsubscribe
    user = User.find_by_unsubscribe_hash(params[:unsubscribe_hash])
    user.update_attribute(:comment_subscription, false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def submission_params
      params.require(:submission).permit(:title, :body, :url, :submission_image, :submission_video, :community_id)
    end
end

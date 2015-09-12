class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_filter :load_project
  # GET /issues
  # GET /issues.json
  def index
    @issues = @project.issues.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = @project.issues.find(params[:id])
    @comment = Comment.new
  end

  # GET /issues/new
  def new
    @issue = @project.issues.new
  end

  # GET /issues/1/edit
  def edit
    @issue = @project.issues.find(params[:id])
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = @project.issues.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to [@project, @issue], notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    @issue = @project.issues.find(params[:id])
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to [@project, @issue], notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = @project.issues.find(params[:id])
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to project_issues_path(@project), notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def load_project
      @project = Project.find(params[:project_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :body, :project_id)
    end
end

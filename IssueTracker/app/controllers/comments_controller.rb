class CommentsController < ApplicationController
        before_filter :load_project
        before_filter :load_issue
        def create
                @issue = @project.issues.find(params[:issue_id])
                @comment = @issue.comments.create!(comment_params)
                redirect_to project_issue_path(@project, @issue)
        end
        private
          def load_project
            @project = Project.find(params[:project_id])
          end
          def set_issue
            @issue = Issue.find(params[:id])
          end
          def load_issue
            @issue = Issue.find(params[:issue_id])
          end
          # Never trust parameters from the scary internet, only allow the white list through.
          def issue_params
            params.require(:issue).permit(:title, :body, :project_id)
          end
          def comment_params
            params.require(:comment).permit(:body)
  end
end

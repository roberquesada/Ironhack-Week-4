class ProjectsController < ApplicationController
  def index

    @projects = Project.last_created_projects(10)

    if (@projects.empty?)
        render('no_projects_found')
    end

  end

  def show
    # @project = Project.find(params[:id])
    # rescue ActiveRecord::RecordFound
    # render 'no_projects_found'

    # unless @project = Project.find_by(id: params[:id])
    # render('layouts/404')
    # end

    # @project = Project.find_by(id: params[:id]) || render_404(params)

    if (Project.find_by(id: params[:id]))
        @project = Project.find_by(id: params[:id])
    else
      render_404(params)
    end

    # @project = Project.find_by(id: params[:id]) || render('layouts/404')


  end

end

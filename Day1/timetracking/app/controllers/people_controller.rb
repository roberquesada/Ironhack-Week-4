class PeopleController < ApplicationController

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(entry_params)

    if @person.save
      flash[:notice] = "Person created successfully"
      redirect_to action: 'show', controller: 'people'
    else
      render 'new'
    end

  end

  def show
      @person = Person.find_by(id: params[:id])
      @projects = @person.projects
      @projects_no_associated = @person.select_no_associated_project
    if (@person)
      @person
    else
      render_404(params)
    end

  end

  def update
    @project = Project.find params[:person][:projects]
    @person = Person.find(params[:id])

    @person.projects << @project
    redirect_to action: 'show', controller: 'people'

  end

  private

  def entry_params
    params.require(:person).permit(:name)
  end

end

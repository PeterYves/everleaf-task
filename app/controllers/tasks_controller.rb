class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # before_action :authorize
  # GET /tasks
  def index 
    @tasks = if params[:term]
      Task.where('status LIKE ? or name LIKE ?', "%#{params[:term]}%","%#{params[:term]}%").page params[:page]
    elsif params[:term1]
      Task.where('name LIKE ?', "%#{params[:term1]}%").page params[:page]
    elsif params[:term2]
      Task.where('status LIKE ?', "%#{params[:term2]}%").page params[:page]
    else
      #@tasks = Task.all.order('created_at desc').page params[:page]
      @tasks = Task.order_list(params[:sort_by]).page params[:page]
    end
  end

  def search
    @task =task.search(params[:search])
   end
  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    #@task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      flash[:error] = 'There was an error creating the task.'
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :details,:status,:priority,:startdate,:enddate,:term,:term1,:term2,:user_id)
    end
end
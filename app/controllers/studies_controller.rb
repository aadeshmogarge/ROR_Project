class StudiesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create

    @study=Study.new(study_params)
    #@study.save

    if @study.save

      StudyMailer.with( study: @study ).success_email.deliver_now
      redirect_to studies_path
      
      
      #render json:  {notice: "Study created successfully!"}
    else
      render :new
      #render json:  {error: "Couldn't create study!"}
    end
    
  end

  def index

    p "Index method called"
    @studies=Study.all

    # render json: @studies
  end

  def new
    @study=Study.new
  end

  def show
  end

  def edit
  end

  def active
  end


  def update
    
    @study=Study.find(params[:id])

    if @study
      @study.update(study_params)
      render json: {notice: "Study updated successfully:"}

    else

      render json:  {error: "Couldn't find study!"}
    end
  end


  private

  def study_params
    params.require(:study).permit(:name, :age_limit, :drug, :phase, :study_group_id, :symptoms)
    #params.require(:study).permit!
  end

end

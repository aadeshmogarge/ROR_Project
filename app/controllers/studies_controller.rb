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


# class StudiesController < ApplicationController
#   def root
#   end

#   def index
#     @studies = Study.all
#   end

#   def new
#     @study = Study.new
#   end

#   def create
#     @study = Study.new(study_params)
#     if @study.save
#       redirect_to studies_index_path, notice: 'Study added...'
#     else
#       render :new
#     end
#   end

#   def destroy
#     @study = Study.find(params[:id])
#     if @study.destroy
#       redirect_to studies_index_path
#     else
#       render plain: 'cant be deleted'
#     end
#   end

#   def edit
#     @study = Study.find(params[:id])
#   end

#   def update
#     @study = Study.find(params[:id])
#     if @study.update(study_params)
#       redirect_to studies_index_path
#     else
#       render :edit
#     end
#   end

#   def report
#     study = Study.find(params[:id])
#     # GenerateReportJob.perform_later(study)
#     put_report_content(study)
#     File.write("#{Rails.root}/app/assets/docs/drug_report.txt", put_report_content(study))
#     send_file "#{Rails.root}/app/assets/docs/drug_report.txt", type: "application/pdf", x_sendfile: true, filename: "#{study.title}_drug_report.txt"
#   end

#   private

#   def study_params
#     params.require(:study).permit(:title, :therapeutic_area, :phase, :status, :start_date, :projected_end_date, :no_of_subjects)
#   end

#   def put_report_content(study)
#     site_names = study.sites.pluck(:name)
#     subject_names = study.sites.collect { |site| site.subjects.collect { |sub| sub.name } }.flatten
#     total_happy_count = 0
#     total_sad_count = 0
#     total_neutral_count = 0
#     study.sites.each do |site|
#       total_happy_count = total_happy_count + site.subjects.pluck(:rating).count('Happy')
#       total_sad_count = total_sad_count + site.subjects.pluck(:rating).count('Sad')
#       total_neutral_count = total_neutral_count + site.subjects.pluck(:rating).count('Neutral')
#     end
#     happy_percentage = (total_happy_count.to_f / study.no_of_subjects.to_f) * 100
#     sad_percentage = (total_sad_count.to_f / study.no_of_subjects.to_f) * 100
#     neutral_percentage = (total_neutral_count.to_f / study.no_of_subjects.to_f) * 100

#     "Drug Report For Study: #{study.title}\nTherapeutic Area: #{study.therapeutic_area}\nPhase: #{study.phase}\nTotal no of sites: #{study.sites.size}\nTotal no of subjects: #{study.no_of_subjects}" +
#       "\n\n***** Associated Sites *****\n#{site_names.join("\n")}" +
#       "\n\n***** Associated Subjects *****\n#{subject_names.join("\n")}" +
#       "\n\n***** Percentage Feedback *****" +
#       "\nHappy Percentage : #{happy_percentage}" +
#       "\nSad Percentage : #{sad_percentage}" +
#       "\nNeutral Percentage : #{neutral_percentage}"
#   end
# end

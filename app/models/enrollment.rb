class Enrollment < ApplicationRecord
  belongs_to :study
  belongs_to :subject

  after_save :audit_log
  def audit_log
    
    Rails.logger.info "We have logged an enrollment"
    #AuditLogJob.perform self

    subject_name, study_name = Subject.name, Study.name

    file = File.join(File.dirname(__FILE__), 'audit.txt')
	  File.open(file, 'a') { |f| f.puts "A subject named #{subject_name} , enrolled to a Study named #{study_name}" }

  end
  handle_asynchronously :audit_log

end

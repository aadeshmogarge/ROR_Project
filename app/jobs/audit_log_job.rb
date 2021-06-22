class AuditLogJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Rails.logger.info "We have logged an enrollment"
    file = File.join(File.dirname(__FILE__), 'audit.txt')
    File.open(file, 'w') { |f| f.puts 'hello' }
  end
end

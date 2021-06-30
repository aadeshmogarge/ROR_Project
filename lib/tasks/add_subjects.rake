namespace :hello do
  desc 'just a task to greet'
  task process: :environment do
  puts 'my first rake task'
  end
end


namespace :add_subjects do
  desc 'Add given no of subjects to a study'
  task :process, [:study_name,:subject_count] => :environment do |t, args|
  end
end
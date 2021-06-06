namespace :my_namespace do
  desc "TODO"
  task my_task1: :environment do
    10000.times{MyWorker.perform_async("notification", 0)}
  end

  desc "TODO"
  task my_task2: :environment do
  end

end

class TaskUpdater
end

def TaskUpdater.reset
  Task.all.each do |task|
    task.doses_given = 0
    task.save
  end
end
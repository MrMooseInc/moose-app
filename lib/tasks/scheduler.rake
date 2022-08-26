desc "Reset doses every night at 3 A.M."
task reset_doses: :environment do
  tasks = Task.all
  tasks.each do |task|
    task.doses_given = 0
    task.save 
  end
end
class ExampleWorkerJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Rails.logger.info("Performing job #{self.arguments.first}")
    sleep rand(10)
    true
  end

end

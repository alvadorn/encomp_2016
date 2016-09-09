class ApplicationJob < ActiveJob::Base
  self.queue_adapter = :queue_classic
end

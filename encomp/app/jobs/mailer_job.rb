class MailerJob < ApplicationJob
  queue_as :default
  self.queue_adapter = :queue_classic

  def perform(*args)
    # Do something later
  end
end

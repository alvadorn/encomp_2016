require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Encomp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_job.queue_adapter = :queue_classic

    #config.after_initialize do
    #  worker = QC::Worker.new
    #  require 'rake'
    #  Rake::Task["qc:work"].invoke
    #end
  end
end

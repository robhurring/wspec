require 'rspec/core'
require 'listen'

module Wspec
  module CLI
    extend self

    def start
      options = RSpec::Core::ConfigurationOptions.new(ARGV)
      options.parse_options
      rspec_files = options.options[:files_or_directories_to_run] || []
      
      listen_dirs = []
      listen_files = []

      rspec_files.each do |file|
        filename, line = file.split(':')
        listen_dirs |= [File.dirname(filename)]
        listen_files |= [File.expand_path(filename, ".")]
      end

      listener = Listen.to(*listen_dirs) do |modified, added, removed|
        run = false

        modified.each do |m|
          if listen_files.include?(m)
            run = true
          end
        end

        if run
          puts "Re-running specs..."
          fork { RSpec::Core::Runner.autorun }
        end
      end

      trap 'INT' do
        listener.stop
      end

      at_exit do
        listener.start
        sleep
      end
    end
  end
end
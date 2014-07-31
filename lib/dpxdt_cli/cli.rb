require 'thor'
require 'dpxdt_cli'

module DpxdtCli
  class CLI < Thor

    desc "generate INPUT_FILE OUTPUT_DIR", "Generate dpxdt configs for all ccns"
    def generate(input, output)
      DpxdtCli::ConfigGenerator.generate(input, output)
    end

    desc "test_run", "Trigger a test run for all ccns"
    method_option :executable
    method_option :dpxdt_server
    method_option :test_dir
    method_option :release_cut_url
    method_option :ccn_config
    def test_run()
      DpxdtCli::TestRunner.run(options)
    end

  end
end

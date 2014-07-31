require 'thor'
require 'dpxdt_cli'

module DpxdtCli
  class CLI < Thor

    desc "generate INPUT_FILE OUTPUT_DIR", "Generate dpxdt configs for all ccns"
    def generate(input, output)
      DpxdtCli::ConfigGenerator.generate(input, output)
    end

    desc "test_run", "Trigger a test run for all ccns"
    def test_run()
      options = YAML.load(File.open('ccn.yaml'))['test_run_config']
      DpxdtCli::TestRunner.run(options)
    end

  end
end

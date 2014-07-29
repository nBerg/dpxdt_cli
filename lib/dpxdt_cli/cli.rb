require 'thor'
require 'dpxdt_cli'

module DpxdtCli
  class CLI < Thor

    desc "generate INPUT_FILE OUTPUT_DIR", "Generate dpxdt configs for all ccns"
    def generate(input, output)
      DpxdtCli::ConfigGenerator.generate(input, output)
    end

  end
end

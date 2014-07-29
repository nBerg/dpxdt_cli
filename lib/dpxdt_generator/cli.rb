require 'thor'
require 'dpxdt_generator'
require 'dpxdt_generator/generators/config'

module DpxdtGenerator
  class CLI < Thor

    desc "generate INPUT_FILE OUTPUT_DIR", "Generate dpxdt configs for all ccns"
    def generate(input, output)
      DpxdtGenerator::ConfigGenerator.generate(input, output)
    end

  end
end

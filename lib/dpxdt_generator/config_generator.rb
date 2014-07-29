require 'yaml'
require 'json'
require 'deep_merge'

module DpxdtGenerator
  class ConfigGenerator
    def self.generate(input_filename, destination_dir)

      input = YAML.load(File.open(input_filename))
      default_config = input['defaults']

      input.each do |ccn, config|
        next if ccn.eql? 'defaults'

        # Merge the defaults into the ccn config
        #
        # The documentation for deep_merg can be found at
        # https://github.com/danielsdeleo/deep_merge
        # Some points that I found confusing:
        # For dest.deep_merge(src)
        # 1. dest will be modified
        # 2. values in dest will override src
        # 3. This behavior is exactly opposite what is described
        # in the documentation for deep_merge!()
        #
        # TODO: Think about writing a custom deep_merge
        # 1. This implementation is super confusing
        # 2. I could customize the merging of the pages array
        config.deep_merge(default_config)

        # Create the base url
        # TODO: make http/https protocol configurable?
        base = "http://#{ccn}.#{config['domain']}"
        pages = []

        config['pages'].each do |p|
          pages.push(
            name: p['name'],
            run_url: "#{base}#{p['path']}",
            run_config: p['run_config'] || config['run_config']
          )
        end

        # puts JSON.pretty_generate(pages)
        File.write("#{destination_dir}/#{ccn}.json", JSON.pretty_generate(pages))
      end
    end
  end
end

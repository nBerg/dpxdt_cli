
module DpxdtCli
  class TestRunner
    def self.run_one(executable, args)
      args = args.map{|k, v| "--#{k}=#{v}"}.join(' ')
      cmd = "#{executable} #{args}"

      system(cmd) ? puts("success!") : puts("Something went wrong")
    end

    def self.run(options)
      executable = options['executable']
      ccn_config = YAML.load(File.open(options['ccn_config']))

      Dir.glob(File.join(options['test_dir'], '*.json')).each do |file|
        ccn = File.basename(file, '.json')
        args = {
          release_server_prefix: "#{options['dpxdt_server']}/api",
          upload_build_id: ccn_config[ccn]['build_id'],
          release_cut_url: options['release_cut_url'],
          tests_json_path: file
        }

        run_one(executable, args)
      end
    end
  end
end

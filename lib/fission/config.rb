module Fission
  class Config
    attr_accessor :attributes

    CONF_FILE = File.expand_path '~/.fissionrc'

    def initialize
      @attributes = {}
      load_from_file

      if @attributes['vm_dir'].blank?
        @attributes['vm_dir'] = File.expand_path('~/Documents/Virtual Machines.localized/')
      end

      @attributes['vmrun_bin'] = '/Library/Application Support/VMware Fusion/vmrun'
      @attributes['vmrun_cmd'] = "#{@attributes['vmrun_bin'].gsub(' ', '\ ')} -T fusion"
    end

    private
    def load_from_file
      if File.file?(CONF_FILE)
        @attributes.merge!(YAML.load_file(CONF_FILE))
      end
    end

  end
end

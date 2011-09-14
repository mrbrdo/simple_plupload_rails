require "simple_plupload_rails/engine"

# need settings for resize and other plupload settings
# need translation possibility

module SimplePluploadRails
  protected
    def pluploads_copy dest_path = nil, *args
      require 'fileutils'
      dest_path = "#{Rails.public_path}/uploads" unless dest_path
      pluploads_each_file(*args) do |file, orig_name|
        filename = file.path
        FileUtils.cp filename, "#{dest_path}/#{orig_name}"
        FileUtils.rm filename, :force => true
      end
    end
    
    def pluploads_each_file options = nil
      options = {} unless options
      field_name = (options[:field_name] || :pluploads).to_sym
        
      params[field_name].each do |file_json|
        file = ActiveSupport::JSON.decode(file_json)
        yield File.new(file["path"], "r"), File.basename(file["name"])
      end
    end
    
    def pluploads_clean *args
      pluploads_each_file(*args) do |file, orig_name|
        File.delete(file.path)
      end
    end
end

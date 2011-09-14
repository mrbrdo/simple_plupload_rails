module PluploadHelper
  def plupload_field(builder, title = "Browse", field_name = "pluploads")
    builder.submit title, :class => "plupload", "data-url" => plupload_upload_file_path, "data-fieldname" => field_name
  end
end

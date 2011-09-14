class PluploadController < ApplicationController
  def upload_file
    render :json => { :path => params[:file].path(), :name => params[:file].original_filename }
  end

end

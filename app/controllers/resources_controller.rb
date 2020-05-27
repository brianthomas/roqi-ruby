class ResourcesController < ApplicationController

  respond_to :html

  def index
    page = params[:page] != nil ? params[:page] : 1
    @resources = Resource.paginate(:page => page, :per_page => ApplicationHelper::RESULTS_PER_PAGE)
    render :html => @resources
  end

end

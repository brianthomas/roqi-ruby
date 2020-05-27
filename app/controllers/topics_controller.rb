class TopicsController < ApplicationController
  def index
    page = params[:page] != nil ? params[:page] : "1"
    @topics = Topic.paginate(:page => page,
                                 :per_page => ApplicationHelper::RESULTS_PER_PAGE,
                                 :order => 'id ASC')
  end
end

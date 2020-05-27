
module ApplicationHelper

  RESULTS_PER_PAGE = 30

  def pagination_links(collection, options = {})
   options[:renderer] ||= SearchPagination::MyLinkRenderer
   options[:class] ||= 'pagination pagination-centered'
   #options[:inner_window] ||= 2
   #options[:outer_window] ||= 1

   will_paginate(collection, options)
  end

end

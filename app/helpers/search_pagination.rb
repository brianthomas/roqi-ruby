
module SearchPagination
  class MyLinkRenderer < WillPaginate::ActionView::LinkRenderer

    private

    # render links with match param for search results
    def link (text, target, attributes = {})

      last_query = @options[:last_query]

      if target.is_a? Fixnum
        attributes[:rel] = rel_value(target)
        target = url(target)
        target = last_query != nil ? target + "&match="+last_query.to_s : target

        puts " URL (TARGET): "+target.to_s

      end

      unless target == "#"
        attributes[:href] = target
      end

      tag(:a, text, attributes)

    end
  end
end

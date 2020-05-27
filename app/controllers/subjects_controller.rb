class SubjectsController < ApplicationController

  respond_to :html, :xml, :json

  # search for a subject
  def index
    page = params[:page] != nil ? params[:page] : "1"
    @subjects = Subject.paginate(:page => page,
                                 :per_page => ApplicationHelper::RESULTS_PER_PAGE,
                                 :order => 'id ASC')
  end

  # search for a subject
  def search

    @query = params[:match] != nil ? params[:match] : ""
    page = params[:page] != nil ? params[:page] : "1"
    commit = params[:commit] != nil ? params[:commit] : "Search"
    content = params[:content] != nil ? params[:content] : "html"

    # these items shouldn't be here..but doesn't work unless they are
    @subjects = Subject.all
    @match = []
    @resources = nil

    if commit == 'Search'
      # do search for resources and cache last query
      @query.split(",").each { |q|
                               puts "add item to lastquery val:"+q
                               @match << @subjects[q.to_i-1]
      }
    elsif commit == 'Reset'
        @match = ""
    end

    # execute the search for resources by subject
    @resources = find_resources(@match.collect { |s| s.id}, page)

    # allow for different serializations, the default is HTML
    if content == 'json'
      render :json => @resources
    elsif content == 'xml'
      render :xml => @resources
    else
      render :html => @resources
    end

  end

  # this supports server-side tokenInput functionality
  def list
    @subjects = Subject.all
    render :json => @subjects.collect {|s| {:id => s.id, :name => s.name} }
  end

  # show an individual subject
  def show
    page = params[:page] != nil ? params[:page] : "1"
    @show_subject = Subject.find params[:id]

    @topics = WillPaginate::Collection.create(page, ApplicationHelper::RESULTS_PER_PAGE, @show_subject.topics.count) do |pager|
      pager.replace(@show_subject.topics.to_a)
    end
  end

  private
  # @param [Array] subject_ids
  def find_resources (subject_ids, page, options = {})

    # get ranked topic list
    topics = find_topics (subject_ids)

    # we want to preserve the order of the results by topic ranking, so that means using
    # an array, and calling WillPaginate::Collection directly rather than using the usual
    # methods
    resources = topics.collect {|t| Resource.find( t.resources.collect {|r| r.id } )}.flatten

    WillPaginate::Collection.create(page, ApplicationHelper::RESULTS_PER_PAGE, resources.count) do |pager|
      pager.replace(resources)
    end

  end

  # @param [Object] subject_ids
  # @param [Object] options
  def find_topics (subject_ids, options = {})

    nominal_subjects_in_topic = Subject.find(subject_ids)
    optimal_topic_name = to_topic_name (nominal_subjects_in_topic)

    #puts "OPTIMAL TOPIC :"+optimal_topic_name.to_s
    #optimal_topic = Topic.find_by_name(optimal_topic_name)
    #topics << optimal_topic unless optimal_topic == nil
    uniq_topics = {}
    nominal_subjects_in_topic.each { |s| s.topics.each {
        |t| uniq_topics.store(t.id, t) } }

    topics = []
    uniq_topics.values.collect { |t| topics << RankedTopic.new(t,nominal_subjects_in_topic)}

    topics.sort_by {|a| a.rank }.reverse

  end

  def to_topic_name (subjects)
    subjects.map {|s| s.label.to_s }.join("--")
  end

  class RankedTopic

    # @param [Object] topic_name
    # @param [Object] rank
    def initialize (topic, requested_subjects)
       puts "NEW RankedTopic : "+topic.name
       @topic = topic
       @rank = calc_rank (requested_subjects)
    end

    def rank
      @rank
    end

    def resources
      @topic.resources
    end

    def name
      @topic.name
    end

    private
    # determine the rank of the topic based on how many of
    # the subjects we desire to match actually do match
    def calc_rank (requested_subjects)
      rank = 0.0
      score_per_matched_subject = (1.0/requested_subjects.count)
      topic_subjects = @topic.subjects.to_a
      requested_subjects.each {|s| rank += score_per_matched_subject if topic_subjects.include?(s) }

      # ding the match if we have Too many subjects than requested
      if rank > 0.99 && topic_subjects.count > requested_subjects.count
        rank -= (topic_subjects.count - requested_subjects.count) * 0.01
      end

      rank
    end
  end

end


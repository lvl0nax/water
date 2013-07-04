class RealateditemsController < InheritedResources::Base
  before_filter :admin_require, :except => [ :index ]
  def index
    @rel_items = Realateditem.all
    @text = Helptext.where(tag: 'related_item').first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rel_items }
    end
  end

  # GET /coolers/1
  # GET /coolers/1.json
  def show
    @rel_item = Realateditem.find(params[:id])
    @title = @rel_item.try(:seotitle)
    @seodesc = @rel_item.try(:seodesc)
    @seokeys = @rel_item.try(:seokeywords)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rel_item }
    end
  end
end

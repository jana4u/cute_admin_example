class DevelopersController < ApplicationController
  layout "cute_admin"
  before_filter :init_params, :only => :index

  # GET /developers
  # GET /developers.xml
  def index
    @search = Developer.new_search(params[:search])
    @developers, @developers_count = @search.all, @search.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @developers }
    end
  end

  # GET /developers/1
  # GET /developers/1.xml
  def show
    @developer = Developer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @developer }
    end
  end

  # GET /developers/new
  # GET /developers/new.xml
  def new
    @developer = Developer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @developer }
    end
  end

  # GET /developers/1/edit
  def edit
    @developer = Developer.find(params[:id])
  end

  # POST /developers
  # POST /developers.xml
  def create
    @developer = Developer.new(params[:developer])

    respond_to do |format|
      if @developer.save
        flash[:notice] = I18n.t(:created_success, :default => '{{model}} was successfully created.', :model => Developer.human_name, :scope => [:railties, :scaffold])
        format.html { redirect_to(@developer) }
        format.xml  { render :xml => @developer, :status => :created, :location => @developer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @developer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /developers/1
  # PUT /developers/1.xml
  def update
    @developer = Developer.find(params[:id])

    respond_to do |format|
      if @developer.update_attributes(params[:developer])
        flash[:notice] = I18n.t(:updated_success, :default => '{{model}} was successfully updated.', :model => Developer.human_name, :scope => [:railties, :scaffold])
        format.html { redirect_to(@developer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @developer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /developers/1
  # DELETE /developers/1.xml
  def destroy
    @developer = Developer.find(params[:id])
    @developer.destroy

    respond_to do |format|
      format.html { redirect_to(developers_url) }
      format.xml  { head :ok }
    end
  end

  private

  def init_params
    params[:search] ||= {}
  end
end

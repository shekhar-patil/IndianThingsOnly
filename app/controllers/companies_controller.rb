class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    if current_user.present?
      @companies = Company.paginate(page: params[:page], per_page: 5)
    else
      @companies = Company.where(is_approved: true).paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(load_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Submitted for the review.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if current_user.present? && @company.update(load_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy if current_user.present?
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def not_found
  end

  def search_company
    key = params['company']['name'].parameterize.underscore rescue nil
    @company = Company.find_by(key: key)
    if @company
      redirect_to company_url(@company)
    else
      redirect_to not_found_path
    end
  end

  def company_provider
    @companies = Company.where(is_approved: true)
    if params[:search].present?
      @companies = Company.where("name ILIKE :name", name: "%#{params[:search]}%")
    end

    @companies = @companies.paginate(page: params[:page], per_page: 5).map { |c| { id: c.key, text: c.name} }

    respond_to do |format|
      format.json { render json: @companies.to_json }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def load_params
      hash = {}
      hash[:name] = params['company']['name'] if params['company']['name'].present?
      hash[:description] = params['company']['description'] if params['company']['description'].present?
      hash[:picture] = params['company']['picture'] if params['company']['picture'].present?
      hash[:key] = params['company']['name'].parameterize.underscore if params['company']['name'].present?
      hash[:is_approved] = current_user.present? ? (params['company']['is_approved'] == 'true') : false
      hash[:is_indian] = (params['company']['is_indian'] == 'true')
      hash[:category] = params['company']['category'] if CATEGORIES.include?(params['company']['category'])
      hash
    end
end

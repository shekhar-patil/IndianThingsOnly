class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    if current_user.present?
      @companies = Company.includes(:categories).paginate(page: params[:page], per_page: 5)
    else
      @companies = Company.where(is_approved: true).includes(:categories).paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @categories = Category.all
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
      if current_user.present? && @company.update(company_params)
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

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :description, :key, :picture, :picture_cache, :is_approved, :is_indian)
    end

    def load_params
      {
        name: params['company']['name'],
        description: params['company']['description'],
        picture: params['company']['picture'],
        key: params['company']['name'].parameterize.underscore,
        is_approved: false
      }
    end
end

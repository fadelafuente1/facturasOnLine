class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
  def new
    @company = Company.new
  end
  def create 
    @company = Company.new(company_params)
    if @company.save!
      flash[:notice] = "Compañia creada correctamente"
      redirect_to companies_path
    else
      flash[:notice] = "Error al crear la compañia"
      render :new
    end
  end
  private 
    def company_params
      params.require(:company).permit(:name, :address, :cif, :email, :logo_url, :account, :contact_email, :contact_name)
    end
end

class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :set_user_company, only: [:show]
  before_action :set_bill_company, only: [:show]
  
  def index
    @bills = Bill.all
  end

  def new 
    @bill = Bill.new
    @bill.items.build
    @row_id = 0
    @company = Company.find(current_user.company_id)
  end

  def create 
    @bill = Bill.new(bill_params)
    if @bill.save!
      flash[:notice] = 'Factura creada'
      redirect_to bills_path
    else
      flash[:notice] = 'Error al crear factura'
      @company = Company.find(current_user.company_id)
      render :new

    end
  end
  def show

  end
  def edit 

  end
  def update
    @bill = Bill.find(params[:id])  
    if @bill.update_attributes(bill_params)
      redirect_to @bill, notice: 'Factura actualizada'
    else
      render :edit
    end
  end


  def add_item
    @row_id = params['row_id'].to_i + 1
    puts(@row_id)
    respond_to do |format|
      format.js{}
    end
  end
  
  private 
    def bill_params
      params.require(:bill).permit(:name, :billing_id, :total, :date,
                    :billing_address, :billing_name, :billing_city,
                      :billing_postal_code, :billing_cif, :company_id,
                      items_attributes: [:id, :description, :item_type,
                      :amount, :_destroy])
    end
    def set_bill
      @bill = Bill.find(params[:id])
    end
    def set_user_company
      @user_company = @bill.company
    end
    def set_bill_company
    end
  end

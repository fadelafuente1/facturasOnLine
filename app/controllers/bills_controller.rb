class BillsController < ApplicationController
    def index
      @bills = Bill.all
    end

    def new 
      @bill = Bill.new
      @bill.items.build
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
    def edit 
      @bill = Bill.find(params[:id])
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
end

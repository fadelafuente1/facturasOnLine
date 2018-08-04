class BillsController < ApplicationController
    def index
      @bills = Bill.all
    end

    def new 
      @bill = Bill.new
      @company = Company.find(current_user.company_id)
    end

    def create 
      @bill = Bill.new(bill_params)
      if @bill.save
        flash[:notice] = 'Factura creada'
        redirect_to bills_path
      else
        flash[:notice] = 'Error al crear factura'
        render :new

      end
    end
    private 
      def bill_params
        params.require(:bill).permit(:name, :billing_id, :total, :date,
                      :billing_address, :billing_name, :billing_city,
                       :billing_postal_code, :billing_cif, :company_id,
                       , tasks_attributes: [:id, :description, :type,
                        :amount, :_destroy])
      end
end

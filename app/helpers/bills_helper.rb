module BillsHelper
  def change_date_format(date)
    Date.parse(date.to_s).strftime("%m/%d/%Y")
end
end

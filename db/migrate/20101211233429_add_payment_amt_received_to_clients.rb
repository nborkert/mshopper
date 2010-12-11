class AddPaymentAmtReceivedToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :payment_amt_received, :decimal
  end

  def self.down
    remove_column :clients, :payment_amt_received
  end
end

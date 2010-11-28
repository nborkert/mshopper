class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :contact_name
      t.string :email_address
      t.string :phone_number
      t.string :referral_code
      t.string :userid
      t.string :password_hash
      t.string :password_salt
      t.decimal :credit_balance
      t.date :credit_effective_date

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end

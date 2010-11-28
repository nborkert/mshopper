class CreateReferrers < ActiveRecord::Migration
  def self.up
    create_table :referrers do |t|
      t.string :contact_name
      t.string :email_address
      t.string :phone_number
      t.string :referral_code
      t.decimal :referral_rate

      t.timestamps
    end
  end

  def self.down
    drop_table :referrers
  end
end

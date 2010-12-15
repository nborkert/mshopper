class CreateContactUsEmails < ActiveRecord::Migration
  def self.up
    create_table :contact_us_emails do |t|
      t.string :from
      t.string :message
      t.string :subj

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_us_emails
  end
end

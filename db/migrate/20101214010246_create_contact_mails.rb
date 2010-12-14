class CreateContactMails < ActiveRecord::Migration
  def self.up
    create_table :contact_mails do |t|
      t.string :subj
      t.string :message
      t.string :from

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_mails
  end
end

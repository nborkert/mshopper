class DropContactMails < ActiveRecord::Migration
  def self.up
    drop_table(:contact_mails)
  end

  def self.down
  end
end

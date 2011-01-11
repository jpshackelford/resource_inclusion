class InitialTest < ActiveRecord::Migration
  def self.up
    
    create_table :users do |t|
      t.string  :login_id
      t.string  :display_name    
      t.string  :email
    end

    create_table :comments do |t|
      t.text       :text
      t.references :user
    end
    
  end

  def self.down
    drop_table :users
    drop_table :comments    
  end
  
end

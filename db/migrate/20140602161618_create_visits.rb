class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :ip_address
      t.string :visitor_email
      t.string :referrer
      t.belongs_to :link_item, index: true

      t.timestamps
    end
  end
end

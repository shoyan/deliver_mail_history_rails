class CreateDeliverMailHistories < ActiveRecord::Migration
  def change
    create_table :deliver_mail_histories do |t|
      t.string :mail_to
      t.string :mail_subject
      t.string :mail_header
      t.string :mail_body
      t.string :send_date

      t.timestamps null: false
    end
  end
end

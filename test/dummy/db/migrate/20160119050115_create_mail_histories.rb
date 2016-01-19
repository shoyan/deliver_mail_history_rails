class CreateMailHistories < ActiveRecord::Migration
  def change
    create_table :mail_histories do |t|
      t.string :email_to
      t.string :email_title
      t.string :email_header
      t.string :email_body
      t.string :notify_date

      t.timestamps null: false
    end
  end
end

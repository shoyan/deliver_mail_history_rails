class AddAccountIdToMailHistory < ActiveRecord::Migration
  def change
    add_column :mail_histories, :account_id, :string
  end
end

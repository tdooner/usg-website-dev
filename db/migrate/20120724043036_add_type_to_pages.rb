class AddTypeToPages < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.string :type
    end
  end
end

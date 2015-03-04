class AddExtraFieldsToCspReport < ActiveRecord::Migration
  def change
    add_column :csp_reports, :enforce, :boolean, default: false
    add_column :csp_reports, :app_name, :string
  end
end

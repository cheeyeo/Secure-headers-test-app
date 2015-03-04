class CreateCspReports < ActiveRecord::Migration
  def change
    create_table :csp_reports do |t|
      t.string :document_uri,:referrer, :violated_directive, :effective_directive
      t.text :original_policy, :blocked_uri
      t.integer :status_code, default: 0
      t.timestamps null: false
    end
  end
end

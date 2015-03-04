class CspReportsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def index
    @reports = CspReport.all.order("created_at DESC")
  end

  def create
    if params["app_name"] == "secure_headers_test"
      data = request.body.read

      report = CspReport.new

      h = Oj.load(data)

      report.enforce = params["enforce"]
      report.app_name = params["app_name"]
      report.document_uri = h["csp-report"]["document-uri"]
      report.referrer = h["csp-report"]["referrer"]
      report.violated_directive = h["csp-report"]["violated-directive"]
      report.effective_directive = h["csp-report"]["effective-directive"]
      report.original_policy = h["csp-report"]["original-policy"]
      report.blocked_uri = h["csp-report"]["blocked-uri"]
      report.status_code = h["csp-report"]["status-code"]

      report.save!
    end

    head :ok
  end
end

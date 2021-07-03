class NoticeCompaniesController < ApplicationController

  def index
    @notice_companies = current_company.passive_notice_companies.page(params[:page])#.per(20)
    @notice_companies.where(checked: false).each do |notice|
      notice.update(checked: true)
    end
  end
end

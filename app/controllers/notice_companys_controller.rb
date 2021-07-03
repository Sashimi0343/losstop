class NoticeCompanysController < ApplicationController

  def index
    @notice_company = current_company.passive_notice_companys.page(params[:page]).per(20)
    @notice_company.where(checked: false).each do |notice|
      notice.update(checked: true)
    end
  end
end

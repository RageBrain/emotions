class StatisticsController < ApplicationController
  def show
    @statistic = Statistic.find(params[:id])
  end

  def reanalyze
    @statistic = Statistic.find(params[:id])
    @statistic.reanalyze
    redirect_to statistic_path(@statistic), notice: 'Image was reanalyzed'
  end
end

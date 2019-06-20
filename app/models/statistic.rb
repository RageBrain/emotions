class Statistic < ApplicationRecord
  belongs_to :image

  def reanalyze
    statistic = self
    statistic.anger = rand(0.1...0.9).round(2)
    statistic.fear = rand(0.1...0.9).round(2)
    statistic.disgust = rand(0.1...0.9).round(2)
    statistic.contemp = rand(0.1...0.9).round(2)
    statistic.joy = rand(0.1...0.9).round(2)
    statistic.sadness = rand(0.1...0.9).round(2)
    statistic.surprise = rand(0.1...0.9).round(2)
    statistic.save
  end
end

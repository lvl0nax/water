# -*- encoding : utf-8 -*-
module ApplicationHelper

  def seotitle
    return @title ? @title + " | PrimaAqua" : "PrimaAqua - доставка воды"
  end
  def seodescription
    return @seodesc ? @seodesc + " | PrimaAqua" : "PrimaAqua - доставка воды"
  end
  def seokeywords
    return @seokeys ? @seokeys + " | PrimaAqua" : "PrimaAqua - доставка воды"
  end

end

# -*- encoding : utf-8 -*-
# -*- coding : utf-8 -*-
module ApplicationHelper

  def seotitle
    return @title ? @title + " | PrimaAqua" : "Вода питьевая бутилированная. Доставка воды на дом и в офис в Санкт-Петербурге и Ленинградской области | PrimaAqua"
  end
  def seodescription
    return @seodesc ? @seodesc + " | PrimaAqua" : "PrimaAqua - доставка воды"
  end
  def seokeywords
    return @seokeys ? @seokeys + " | PrimaAqua" : "PrimaAqua - доставка воды"
  end

end

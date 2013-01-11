# -*- encoding : utf-8 -*-
# -*- coding : utf-8 -*-
module ApplicationHelper

  def seotitle
    return @title ? @title : " Вода питьевая бутилированная. Доставка воды на дом и в офис в Санкт-Петербурге и Ленинградской области"
  end
  def seodescription
    return @seodesc ? @seodesc : "PrimaAqua - Доставка воды на дом и в офис в Санкт-Петербурге и Ленинградской области"
  end
  def seokeywords
    return @seokeys ? @seokeys : "PrimaAqua - Доставка воды на дом и в офис в Санкт-Петербурге и Ленинградской области"
  end

end

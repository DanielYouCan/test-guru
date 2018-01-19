module BadgesHelper

  RULES_ARR = [%w[attempt attempt], %w[level level], %w[category category]]

  def rules_select
    RULES_ARR
  end

  def header
    header = request.original_url.include?("all") ? t('.header') : t('.my_header')
  end

end

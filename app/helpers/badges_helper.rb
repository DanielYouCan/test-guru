module BadgesHelper

  def rules_select
    rules_arr = Badge::RULES.each_key.map { |k| [k, k] }
  end

end

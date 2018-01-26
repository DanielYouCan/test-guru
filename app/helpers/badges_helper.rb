module BadgesHelper

  def rules_select
    rules = Badge.all.pluck(:rule_title).uniq.map {|r| [r,r]}
  end

  def header
    header = controller.action_name == 'index' ? t('.header') : t('.my_header')
  end

end

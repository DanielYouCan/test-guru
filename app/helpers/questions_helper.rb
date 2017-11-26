module QuestionsHelper
  def question_header(test)
    if current_page?("/questions/#{@question.id}/edit")
      "Edit #{test.title} Question"
    else
      "Create New #{test.title} Question"
    end
  end
end

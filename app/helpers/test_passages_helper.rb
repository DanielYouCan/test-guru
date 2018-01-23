module TestPassagesHelper
  def result(test_passage)
    test_result = (test_passage.correct_questions.to_f / questions_amount(test_passage) * 100).round

    message_success = t('.message_success', test_result: test_result)
    message_failed =  t('.message_failed', test_result: test_result)

    test_result >= 85 ? content_tag(:p, message_success, class: "text-success") : content_tag(:p, message_failed, class: "text-danger")
  end

  def question_number(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end

  def questions_amount(test_passage)
    @questions_amount ||= test_passage.test.questions.count
  end

  def duration_field(test_passage)
    if test_passage.test.duration.present?
      content_tag :div,
                  "",
                  id: "timer_field",
                  data: { test_duration: test_passage.test.duration, test_passage_id: test_passage.id }
    end
  end

end

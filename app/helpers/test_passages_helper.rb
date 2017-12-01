module TestPassagesHelper
  def result(test_passage)
    test_result = (test_passage.correct_questions / test_passage.test.questions.count) * 100

    message_failed = "Your result is #{test_result}%.You successfully passed the test!"
    message_success =  "Your result is #{test_result}. You failed passing the test"
    
    test_result > 85 ? content_tag(:i, message_failed, class: "green_result") : content_tag(:i, message_success, class: "red_result")
  end

  def question_number(test_passage)
    passage_arr = test_passage.test.questions.to_a
    passage_arr.index(test_passage.current_question) + 1
  end
end

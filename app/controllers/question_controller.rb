class QuestionController < ApplicationController
  def home
  end

  def quiz
    randNumber = rand(1..Question.count);
    question = Question.find(randNumber);
    # hashedQuestion = ActiveSupport::JSON.decode(question);
    @questionName = question['question']['question'];
    answersArray = question['question']['answers'];
    # makes an answers array
    answer_a = answersArray['answer_a'];
    answer_b = answersArray['answer_b'];
    answer_c = answersArray['answer_c'];
    answer_d = answersArray['answer_d'];
    answer_e = answersArray['answer_e'];
    answer_f = answersArray['answer_f'];
    @answers = [answer_a, answer_b, answer_c, answer_d, answer_e, answer_f]
  end
end

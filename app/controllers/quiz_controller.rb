class QuizController < ApplicationController
  def home
  end

  def create
    @@user_score = 0;
    @@randomQuestionsArray = [];
    @@numberQuestions = rand(4..10);
    i = 0;
    while i <= @@numberQuestions do
      randNumber = rand(1..Question.count);
      question = Question.find(randNumber);
      if @@randomQuestionsArray.include?(question)
      else 
        @@randomQuestionsArray << question;
        i += 1;
      end
      # if @randomQuestionsArray.include?(question)
      #   numberQuestions += 1;
      # else
      #   @randomQuestionsArray.push(question);
      # end
      # @randomQuestionsArray.push(question);
    end
    redirect_to question_path(id:1);
  end
  
  def question
    @letters = ['a','b','c','d','e','f'];
    @@currentQNo = params[:id].to_i;
    currentQuestion = @@randomQuestionsArray[@@currentQNo-1]
    # currentQuestion = @@randomQuestionsArray[params[:id].to_i];
    @questionName = currentQuestion['question']['question'];
    answersArray = currentQuestion['question']['answers'];
    # # makes an answers array
    answer_a = answersArray['answer_a'];
    answer_b = answersArray['answer_b'];
    answer_c = answersArray['answer_c'];
    answer_d = answersArray['answer_d'];
    answer_e = answersArray['answer_e'];
    answer_f = answersArray['answer_f'];
    @answers = [answer_a, answer_b, answer_c, answer_d, answer_e, answer_f]
  end

  def submit

    if !params[:answer]
      puts 'no params'
      redirect_to question_path(id:@@currentQNo);
    else
      checkanswer()
      @@nextQuestion = @@currentQNo + 1;
      puts @@currentQNo;
      puts @@nextQuestion;
      puts @@numberQuestions;
      if (@@nextQuestion <= @@numberQuestions)
        redirect_to question_path(id:@@nextQuestion);
      else
        redirect_to '/quiz/result';
      end
    end
  end

  def checkanswer()
    question = @@randomQuestionsArray[@@currentQNo];
    correct_answers = question['question']['correct_answers'];

    answer_a_correct = correct_answers['answer_a_correct'];
    answer_b_correct = correct_answers['answer_b_correct'];
    answer_c_correct = correct_answers['answer_c_correct'];
    answer_d_correct = correct_answers['answer_d_correct'];
    answer_e_correct = correct_answers['answer_e_correct'];
    answer_f_correct = correct_answers['answer_f_correct'];
    @correct_answers = [
      answer_a_correct,
      answer_b_correct,
      answer_c_correct,
      answer_d_correct,
      answer_e_correct,
      answer_f_correct, ]

    if @correct_answers[params[:answer].to_i] == "true" 
      @@user_score += 1;
    end
  end

  def result
    @final_score = @@user_score;
    @numberQuestions = @@numberQuestions;
    puts @final_score;
    puts @@nextQuestion;
    puts @numberQuestions;
  end



end

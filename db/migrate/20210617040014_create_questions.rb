class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.json 'question'
      t.timestamps
    end
  end
end

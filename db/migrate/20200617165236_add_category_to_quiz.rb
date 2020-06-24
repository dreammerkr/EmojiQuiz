class AddCategoryToQuiz < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :Category, :string
  end
end

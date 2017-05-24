# Rails will connect this model to a table named `questions` by default as it
# uses the pluralized version of the class name.
# Also, Rails will give you attribute accessor to all the columns of the table.
class Question < ApplicationRecord
  belongs_to :category, optional: true
  # by default belongs_to adds a validation to verify that
  # the association exists
  # validates :category_id, presence: true

  #It's highly recommended that you add the dependent option to the association which tells Rails what to do when you delete a Question that has answer associated to tit. The most popular options are:
  # - ':destroy' which will delete all associated answers before deleting the question
  # - ':nullify' which will update all the question_id fields on the associated answers to bee Null before deleting the question. For example if you want to delete a profile, but keep the comments to it.
  has_many  :answers, dependent: :destroy

  #has_many answers expects that the answers table will have a question_id reference columnt.

  # has_many :answers method adds the following methods to Questions:
  # answers
  # answers<<(object, ...)
  # answers.delete(object, ...)
  # answers.destroy(object, ...)
  # answers=(objects)                -> give it an array of answers that will be associated to the question
  # answers_singular_ids              -> array of integers of all the related answers
  # answers_singular_ids=(ids)
  # answers.clear
  # answers.empty?                     -> to check if it's answer
  # answers.size
  # answers.find(...)
  # answers.where(...)
  # answers.exists?(...)                     -> to check if it exists
  # answers.build(attributes = {}, ...)
  # answers.create(attributes = {})
  # answers.create!(attributes = {})

  validates(:title, { presence: { message: 'must be provided'}, uniqueness: true})
  # presence makes sure it is not empty.
  #uniqueness makes sure there are no duplicates (it is unique)
  #messages: 'must be provided' is optional, to adjust the default messages

  validates(:body, { length: { minimum: 5, maximum: 1000 }})
  validates :view_count, numericality: { greated_than_or_equal_to: 0 }

  after_initialize :set_defaults # this belongs with the code below. Callback example
  before_validation :titleize_title # here you say when in the lifecycle to execute the def titleize_title
  #lifecycle: initialize, validation, save, commit

  # scope :recent, lambda {|number| order(created_at: :desc).limit(number) }   => same as below
  def self.recent(number)
    order(created_at: :desc).limit(number)
  end

  def cap_title
    title.upcase
  end


  private

  #When you use self, it's a class method. Otherwise it's on the instance / object.
  def set_defaults
    self.view_count ||= 0       # if you don't provide anything, it will default it to zero
  end

  def titleize_title
    self.title = title.titleize if title.present?
  end

end

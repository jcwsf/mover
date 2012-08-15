class Article < ActiveRecord::Base
  has_many :comments
  before_move_to_table :ArticleArchive do
    comments.each { |c| c.move_to_table(CommentArchive, move_options) }
  end
end
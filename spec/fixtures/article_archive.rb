class ArticleArchive < ActiveRecord::Base
  has_many :comments, :class_name => 'CommentArchive', :foreign_key => 'article_id'
  before_move_to_table :Article do
    comments.each { |c| c.move_to_table(Comment, move_options) }
  end
end
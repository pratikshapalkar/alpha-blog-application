# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  title      :string
#  body       :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord

  ## Associations
  belongs_to :user
end

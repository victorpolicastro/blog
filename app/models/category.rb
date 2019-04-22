# == Schema information
#
# Table name: categories
#
# id            :integer
# title         :string
# created_at    :datetime
# updated_at    :datetime
#

class Category < ApplicationRecord
  paginates_per 10
end

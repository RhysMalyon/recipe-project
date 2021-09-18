# Unit test for bookmarks.
require 'rails_helper'
require_relative '../app/models/bookmark'

RSpec.describe Bookmark, type: :model do
  it 'is created by a user'
  it 'references a recipe'
end

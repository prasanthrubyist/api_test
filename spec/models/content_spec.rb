require 'rails_helper'

RSpec.describe Content, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # Validation tests
  # ensure columns title, author are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:published_date) }
end

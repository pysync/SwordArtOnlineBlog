class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  before_validation :ensure_text_has_value
  
  protected
    def ensure_text_has_value
      if text.nil?
        self.text = title
      end
    end
end

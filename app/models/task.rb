class Task < ApplicationRecord
    #以下は試験機能のため、コメントアウト
    #before_validation :set_nameless_name
    
    validates :name, presence: true, length: { maximum: 30 }
    validate :validate_name_not_including_comma
    
    belongs_to :user
    
    scope :recent, -> { order(created_at: :desc) }
    
    private
    
    def validate_name_not_including_comma
        errors.add(:name, ' にカンマを入力することはできません') if name&.include?(',')
    end
    
    private
    
    def set_nameless_name
        self.name = '名前なし' if name.blank?
    end
end

class Task < ApplicationRecord
    validates :title, presence: true
    validate :not_before_today
    validate :start_end_check
    def not_before_today
      errors.add(:startdate, 'は今日以降の日付で選択してください') if startdate.nil? || startdate < Date.today
      errors.add(:finishtime, 'は今日以降の日付で選択してください') if startdate.nil? || startdate < Date.today
    end

    def start_end_check
      errors.add(:finishtime, "は開始日より前の日付は登録できません。") unless
      self.startdate <= self.finishtime
    end

  end


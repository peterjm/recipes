module PerformsActionOnSave
  extend ActiveSupport::Concern

  included do
    class_attribute :after_save_actions
    self.after_save_actions = []

    after_save :perform_after_save_actions
  end

  def perform_after_save_actions
    after_save_actions.each do |action|
      perform_after_save_action(action)
    end
  end

  def perform_after_save_action(action)
    if self.public_send("#{action}_on_save")
      self.public_send("#{action}_on_save=", false)
      self.send(action)
    end
  end

  module ClassMethods
    def action_on_save(*actions)
      actions.each do |action|
        after_save_actions << action
        attr_accessor "#{action}_on_save".to_sym
      end
    end
  end
end

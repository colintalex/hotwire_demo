class Vehicle < ApplicationRecord

  after_update_commit :update_message_count

  private

  def update_message_count
    dom_id = ActionView::RecordIdentifier.dom_id(self, :info)
    broadcast_update_to(dom_id, target: dom_id, partial: "vehicles/vehicle", locals: { vehicle: self })
  end
end

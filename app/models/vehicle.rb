class Vehicle < ApplicationRecord
  after_update_commit :update_vehicle_info
  after_destroy_commit :remove_vehicle_info

  private

  def update_vehicle_info
    dom_id = ActionView::RecordIdentifier.dom_id(self, :info)
    broadcast_update_to(dom_id, target: dom_id, partial: "vehicles/vehicle", locals: { vehicle: self })
  end

  def remove_vehicle_info
    dom_id = ActionView::RecordIdentifier.dom_id(self, :info)
    broadcast_update_to(dom_id, target: dom_id, partial: "vehicles/removed")
  end
end

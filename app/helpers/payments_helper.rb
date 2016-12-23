module PaymentsHelper
  def field_material
    fields_for :material_payments do |mp|
      check_box_tag 'payment[material_payments_attributes][0][material_id]', 1
      label_tag 'payment[material_payments_attributes][0][material_id]', @materials.find(1).material_name
      mp.number_field :quantity,
                      hide_label: true,
                      append: 'м.'
    end
  end
end
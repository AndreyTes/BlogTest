ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation

  index do
    column :name
    column :email
    column :encrypted_password
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

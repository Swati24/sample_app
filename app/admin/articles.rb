ActiveAdmin.register Article do

	scope :drafted
  scope :published

  controller do
    def scoped_collection
      Article.includes(:user)
    end
  end

  filter :title
	filter :content
	filter :user
	filter :state
	filter :created_at

	index :download_links => false do
		column :id
		column :title
		column :user
		column :state
		column :created_at
		column "" do |resource|
			links = ''.html_safe
			links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link show_link"
			links
		end
	end

	form do |f|
    f.inputs "Details" do
    	f.input :user, collection: User.all, :include_blank => false
     	f.input :title
      f.input :content
      f.input :state, :collection => Article.aasm.states, :include_blank => false
    end
    f.actions
  end





end

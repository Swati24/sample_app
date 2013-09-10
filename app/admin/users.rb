ActiveAdmin.register User do
  scope :editors
  scope :reporters

  filter :name
	filter :email
	filter :articles_count
	filter :role
	filter :created_at

	index :download_links => false do
		column :id
		column :name
		column :email
		column :articles_count
		column :role
		column :created_at
		column "" do |resource|
			links = ''.html_safe
			links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link show_link"
			links
		end
	end

	form do |f|
    f.inputs "Details" do
    	f.input :name
     	f.input :email
      f.input :role, :collection => User::ROLES, :include_blank => false
    end
    f.actions
  end


  show :title => :name do
  	attributes_table do
  		rows :id, :name, :email, :role, :created_at, :current_sign_in_at, :articles_count
  	end
    panel "Articles" do
      table_for(user.articles) do
        column("Title") { |article| link_to article.title, admin_article_path(article) }
        column("Content") { |article| article.content}
        column("State") { |article| article.state }
      end
    end
  end

end

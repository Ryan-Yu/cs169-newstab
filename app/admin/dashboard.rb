ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    columns do
      column do
        panel "Recently added articles" do
          table_for Article.order("created_at desc").limit(10) do
            column :title do |article|
                link_to article.title, [:admin, article]
            end
            column :url
            column :user_id
            column :created_at
          end
        end
        
        panel "Recently registered users" do
          table_for User.order("created_at desc").limit(10) do
            column :user do |user|
                link_to user.email, [:admin, user]
            end
            column :first_name
            column :last_name
          end
        end
      end
      
    end
    
  end
end

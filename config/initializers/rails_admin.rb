RailsAdmin.config do |config|
   config.authenticate_with do
    warden.authenticate! scope: :admin
   end

  config.model 'User' do
   navigation_icon 'icon-user'
  end
  config.model 'Admin' do
   navigation_icon 'icon-user'
  end
  config.model 'Question' do
   navigation_icon 'icon-pencil'
  end
  config.model 'Scode' do
   navigation_icon 'icon-certificate'
  end
  config.model 'Topiccode' do
   navigation_icon 'icon-certificate'
  end
  config.model 'Subtopiccode' do
   navigation_icon 'icon-certificate'
  end
  config.model 'Ckeditor::Pictures' do
   navigation_icon 'icon-picture'
  end
  config.model 'Ckeditor::AttachmentFile' do
   navigation_icon 'icon-file'
  end

  config.current_user_method(&:current_admin)
  ### Popular gems integration
  config.excluded_models << "Ckeditor::Asset"
  #config.included_models = ['Question', 'Scode', 'Subtopiccode','Topiccode', 'Admin','User', 'Ckeditor::Pictures']
  Rails.application.eager_load!
  #config.included_models = ActiveRecord::Base.descendants
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

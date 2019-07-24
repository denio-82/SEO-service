Rails.application.routes.draw do
  root to: 'sites#request_form'

  get 'sites/request_form'
  get 'sites/analysis'
end

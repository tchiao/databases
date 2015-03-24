module ApplicationHelper

  def model_class(model_status)
    if model_status
      'primary_record'
    else
      'secondary_record'
    end
  end

end


# @current_user = current_user rescue @current_user
json.object_type 'user'
json.id @current_user.id
json.email @current_user.email

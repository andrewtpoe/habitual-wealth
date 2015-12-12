json.object_type 'errors'
json.errors @errors.each do |k,v|
  json.set! k, v
end

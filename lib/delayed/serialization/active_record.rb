class ActiveRecord::Base
  yaml_as "tag:ruby.yaml.org,2002:ActiveRecord"

=begin
  # this blocks the use of reusing yaml for inserting AR records unavailable in current database (as in, import)

  def self.yaml_new(klass, tag, val)
    klass.unscoped.reset.find(val['attributes'][klass.primary_key])
  rescue ActiveRecord::RecordNotFound
    raise Delayed::DeserializationError
  end
=end

  def to_yaml_properties
    ['@attributes']
  end
end

# raoh_type
Force type by type conversion and transformation and value constraint

## Example

```ruby
require 'raoh_type'

attribute = Raoh::Attribute.new(String, transform: %i[downcase!])
attribute.set('Maxime')
puts attribute.get
=> maxime

attribute = Raoh::Attribute.new(Integer)
attribute.set('-543')
puts attribute.get
=> -543

attribute = Raoh::Attribute.new(String)
attribute.set('Maxime')
attribute.set('Désécot')
puts attribute.changed?
=> true
```
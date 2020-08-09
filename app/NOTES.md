
## Cheatsheet

### Rails
Web console (to show errors) is only enabled in the same machine the server is 
running. It can be whitelisted by ip in `config/environments/development.rb`
```
config.​web_console​.​whitelisted_ips​ = ​%w( 0.0.0.0/0 ::/0 )​
```

* Undo and reapply last migration
```bin/rails db:migrate:redo```

* Toggle caching in dev environment `bin/rails dev:cache`

* Complex scaffold `bin/rails generate scaffold LineItem product:references cart:belongs_to`

#### Good practices

* Review the logs periodically, including logs/test.log

* Usage of `product_path` vs `product_url`. The latest is only needed for redirects or domain changes

### Ruby

Important things done differently as to what I'm use to

#### Naming

* Instance variables begin with an at (@)
* Words in method and variable names are separated with snake_case instead of camelCase

#### Strings

`%{}` can replace double quotes (like """ in other languages)

##### Symbols

Used as keys for method parameters or looking things up in hashes. Similar to named parameters 
in kotlin and maps in groovy, but with colons (:symbol_name) 

#### Arrays

* Appending to an array using `<<`

```
ages = []
for person in @people
    ages << person.age
end
```

* Shortcut for arrays of words:
```
a = %w{ ant bee cat dog elk }
```

#### Hashes (calling them hashes is also different)

Same key can be defined more than once, and the last value would _win_

>In rails hashes typically use symbols as keys, and it also has a "JSON" like syntax for it:
```
inst_section = {
    cello: 'string',
    clarinet: 'woodwind',
    drum: 'percussion',
    oboe: 'woodwind',
    trumpet: 'brass',
    violin: 'string'
}
```

#### Regex

Only highlights here...

* Specified by `/pattern/` or `%r{pattern}`
* Matched using `=~` operator

#### Blocks

They look like lambdas :thinking:

* Can be declared enclosed in braces (by convention for one liners) or between do ... end.
* Arguments are  declared with vertical bars `“animals.​each​ {|animal| puts animal }"`
* A block is declared as a method parameter using `&`:
```
def wrap &b
    print "Santa says: "
    3.times(&b)
    print "\n"
end

wrap { print "Ho! " }
```

#### Exceptions

* `begin/rescue` seems to replace `try/catch`
* It seems rescue can be directly placed at the outermost level of a method definition but there
 is no example, not sure I understand it yet

#### Classes

* prefixing a method with `self` makes it a class level method
* Instance variables need getters/setters **but** there is syntax to avoid them:
```
class​ Greeter
​ 	  attr_accessor  ​:name​       ​# create reader and writer methods​
​ 	  attr_reader    ​:greeting​   ​# create reader only​
​ 	  attr_writer    ​:age​        ​# create writer only​
​end​
```
* Methods visibility work like in Kotlin

#### Modules

* Seems like a set of functions/methods

#### Idioms
##### empty! and empty?

* `!` methods normally do something destructive to the receiver
* `?` methods return true or false

##### ||=
```count ||= 0```
equivalent to `count = count` if count is not nil or false or `count = 0` otherwise

##### self.new

Useful to return subclasses when the method has been extended. If the parent class has `Parent.new` it will 
return `Parent` when used by `Children` class. But if it has `self.new` it will return a `Children` class

##### ->

Turns a block into a lambda

##### Extra resources

* http://www.ruby-lang.org/en/documentation/ruby-from-other-languages/
* http://en.wikipedia.org/wiki/Ruby_programming_language
* http://www.zenspider.com/Languages/Ruby/QuickRef.html

## Bibliography
### Books

Recommended book to learn Ruby: (The PickAxe book) Programming Ruby “Dave Thomas,
 with Chad Fowler and Andy Hunt. Programming Ruby 1.9 & 2.0 (4th edition). The 
Pragmatic Bookshelf, Raleigh, NC, 4th, 2013.”

### Articles/blogs

* [Rusian doll caching](https://signalvnoise.com/posts/3113-how-key-based-cache-expiration-works)
* [Turbolinks](https://github.com/turbolinks/turbolinks-classic)
* [dom testing](https://github.com/rails/rails-dom-testing)
* [caching offical doc](https://guides.rubyonrails.org/caching_with_rails.html)
* [chubby models on a diet (more on concerns)](https://signalvnoise.com/posts/3372-put-chubby-models-on-a-diet-with-concerns)
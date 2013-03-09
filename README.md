# bloom

I wanted to answer the question of how difficult it would be to implement a
reasonably-fast bloom filter in Ruby. Turns out it's not that hard and doesn't
take a lot of code to make that dream come true.

## Usage

Add this to your `Gemfile`:

    gem 'bloom', git: 'git@github.com:mstahl/bloom.git'

Now you can create bloom filters with a given bitfield size and number of
hashing functions:

    bloom = Bloom::Bloom.new(m: 16384, k: 64)

This will create a bloom filter with `m` bits and `k` hashing functions.
Items may be added to the bloom filter using `<<` or the `#add` method:

    bloom << 72385635
    bloom.add({foo: 'bar', baz: 'quux'})

Items may _not_ be removed from the set! To query if an element is in the set:

    bloom.include?(13)

If this method returns `false`, the element is most definitely not in the set,
but if it returns `true` there is a probability that a false positive has been
given. This probability is returned by the `#false_positive_probability`
method.

## Caveats

The reason this code is so simple is because I borrowed Ruby's `Object#hash`
method, which is defined for all objects of all kinds. I have not looked into
the distribution of the `Object#hash` method, but bloom filters do not work
very well if the distribution of their component hash functions is not uniform
or close to uniform. This will require further investigation. I mostly wrote
this to show how easily a bloom filter can be implemented using the magic of
Ruby.

## Contributing to bloom
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 max thom stahl. See LICENSE.txt for
further details.


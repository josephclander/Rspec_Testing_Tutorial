# Ruby for Newbies Testing Tutorial Video - (Modern Update)

As part of the [Makers](https://www.makers.tech/) pre-course curriculum there is an extra exercise to go through this video on using Rspec with classes from 2011.
[Ruby for Newbies: Testing Ruby with Rspec](https://www.youtube.com/watch?v=JhR9Ib1Ylb8)

## Description

You follow a Red, Green, Refactor testing loop to create a Book class and then a Library class to take those books.

## Modern Updates to Video

It is an older specification of Rspec so some elements are no longer true. By completing the exercise alongside the video I noticed the following:

- Running `rspec --init` will now load `spec/spec_helper.rb` and `.rspec` automtically with `--require spec_helper` in the `.rspec` file. So you don't need to import these individually in files.
- `.should` is deprecated/ing so used `expect()` syntax
- `have()` is still available in a module but apparently this was done because it was confusing.
- The docs stated `lambda` as useable but the syntax I updated with is the more modern way to go. I also added `raise_error` instead of `raise_exception`. These are interchangeable.

```ruby
it 'throws ArgumentError when given fewer than 3 parameters' do
  expect { Book.new 'Title', 'Author' }.to raise_error ArgumentError
end
```

## How to use

If `Rspec` is not already installed globally run:

```shell
gem install rspec
```

in the terminal.
I have added `--format documentation` to the `.rspec` file so you can see the passing tests and get a better feel for what is happening.

From the root, run the tests with:

```shell
rspec spec
```

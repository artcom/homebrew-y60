# Homebrew-y60

This repository contains the y60 engine plus dependencies as formulae for [Homebrew](https://github.com/mxcl/homebrew).

Y60 is a 3d opengl rendering engine by ART+COM (http://y60.artcom.de)

## Current Versions

- asl (1.0.9)
- acmake (1.0.9)
- y60 (1.0.9)
- watchdog (1.0.9)
- tuio_cpp (1.4)
- cclib (head of master branch)

Dependencies: tbd

## Installing Homebrew-y60 Formulae

Just `brew tap artcom/y60` and then `brew install <formula>`.

You can also install a specific forumlare directly via URL:

```
brew install https://raw.github.com/artcom/homebrew-y60/master/<formula>.rb
```

## Docs
`brew help`, `man brew`, or the Homebrew [wiki][].

[wiki]:http://wiki.github.com/mxcl/homebrew


## Development

while editing the formulae guard support is provided.

run guard via
<pre>
$ bundle exec guard
</pre>

(requires a ruby + bundler setup of course. rvm is recommended)

### Ruby version and Gemset name recommendation

For convenient rvm environment setup a recommendation for ruby version and gemset name are supplied and can be activated via

<pre>
$ ln -s .ruby-version.dev .ruby-version
$ ln -s .ruby-gemset.dev .ruby-gemset
$ cd .
</pre>

Feel free to ignore this step though and do things another way you prefer.

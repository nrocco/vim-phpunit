# vim-phpunit

a vim plugin to run phpunit from vim


## installation

Recommended way of installing the plugin is to use `Vundle` by adding this
repository to your vimrc:

    Bundle 'nrocco/vim-phpunit'

And then run:

    :BundleInstall


## configuration

The path to phpunit is configurable by setting this in your `.vimrc`:

    let g:phpunit_bin = 'phpunit'


The default options for phpunit is configurable by setting this in your `.vimrc`:

    let g:phpunit_opts = '--bootstrap somefile.php -c app'



## License

Copyright (c) Nico Di Rocco. Distributed under the same terms as Vim itself. See `:help license`.

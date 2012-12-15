/*global desc: true*/
/*global task: true*/
/*global jake: true*/
/*global namespace: true*/
/*global console: true*/
/*global exec: true*/


desc('Default task');
task('default', [], function(params) {
  jake.Task['setup:link'].invoke();
  jake.Task['setup:submodules'].invoke();
});


namespace('setup', function() {

  desc('Links files and dirs to your home directory');
  task('link', [], function(params) {
    console.log('Linking files and dirs to your home directory...');

    var cmds = [
      'ln -s ~/Dotfiles/vim ~/.vim',
      'ln -s ~/Dotfiles/oh-my-zsh ~/.oh-my-zsh',
      'ln -s ~/Dotfiles/ackrc ~/.ackrc',
      'ln -s ~/Dotfiles/gitconfig ~/.gitconfig',
      'ln -s ~/Dotfiles/gitignore ~/.gitignore',
      'ln -s ~/Dotfiles/hgignore_global ~/.hgignore_global',
      'ln -s ~/Dotfiles/jshintrc ~/.jshintrc',
      'ln -s ~/Dotfiles/pearrc ~/.pearrc',
      'ln -s ~/Dotfiles/tmux.conf ~/.tmux.conf',
      'ln -s ~/Dotfiles/vimrc ~/.vimrc',
      'ln -s ~/Dotfiles/zshrc ~/.zshrc'
    ];

    jake.exec(cmds, function() {
      console.log('Linking complete.');
    }, { printStdout: true } );
  });

  desc('Inits and updates the submodules');
  task('submodules', [], function(params) {
    console.log('Initializing and updating the git submodules...');

    var cmds = [
      'git submodule init',
      'git submodule update',
      'git submodule foreach git checkout HEAD',
      'git submodule foreach git pull'
    ];

    jake.exec(cmds, function() {
      console.log('Submodules complete.');
    }, { printStdout: true } );
  });


  desc('Install grunt/node stuff.');
  task('node', [], function(params) {
    console.log('Installing npm, grunt and other stuff...');

    var cmds = [
      'curl https://npmjs.org/install.sh | sh',
      'npm install -g grunt-cli',
      'npm install -g jshint',
      'npm install -g uglify-js',
      'npm install -g jake'
    ];

    jake.exec(cmds, function() {
      console.log('Grunt/Node stuff installed.');
    }, { printStdout: true } );
  });

});

desc('Activate zsh');
task('zsh', [], function() {
  console.log('Activating ZSH...');

  var cmds = [
    'chsh -s `which zsh`',
    '/usr/bin/env zsh',
    'source ~/.zshrc',
    'sudo mv /etc/zshenv /etc/zprofile'
  ];

  jake.exec(cmds, function() {
    console.log('ZSH activated.');
  });
});

/* global slate: false */

// show the overlay hints for applications
var hint = slate.operation('hint', {
  characters: 'jkl;asdfqwertyuiop[]zxcvbnm,'
});


// custom resize grids for all monitors 6x4
var grid = slate.operation('grid', {
  padding: 10,
  grids: {
    0: {
      width: 6,
      height: 2
    },
    1: {
      width: 6,
      height: 2
    },
    2: {
      width: 6,
      height: 2
    }
  }
});


// ultrafast application-switching
var iterm = slate.operation('focus', { app: 'iTerm' });
var chrome = slate.operation('focus', { app: 'Google Chrome' });
var mail = slate.operation('focus', { app: 'Mail' });
var fork = slate.operation('focus', { app: 'ForkLift' });
var things = slate.operation('focus', { app: 'Things' });
var firefox = slate.operation('focus', { app: 'Firefox' });


var fullscreen = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX',
  height: 'screenSizeY'
});

var fullheight = slate.operation('move', {
  x: 'windowTopLeftX',
  y: 'windowTopLeftY',
  width: 'windowSizeX',
  height: 'screenSizeY'
});

var resizeToBottom = slate.operation('resize', {
  width: '+0',
  height: '+10'
});

var resizeToRight = slate.operation('resize', {
  width: '+10',
  height: '+0'
});

var throwNext = function (win) {
  'use strict';

  var winRect = win.rect();
  var screen = win.screen().visibleRect();

  var newX = (winRect.x - screen.x) / screen.width + '*screenSizeX+screenOriginX';
  var newY = (winRect.y - screen.y) / screen.height + '*screenSizeY+screenOriginY';
  var newWidth = winRect.width / screen.width + '*screenSizeX';
  var newHeight = winRect.height / screen.height + '*screenSizeY';

  throwNext = slate.operation('throw', {
    x: newX,
    y: newY,
    width: newWidth,
    height: newHeight,
    screen: 'next'
  });
  win.doOperation(throwNext);
};

var throwPrev = function (win) {
  'use strict';

  var winRect = win.rect();
  var screen = win.screen().visibleRect();

  var newX = (winRect.x - screen.x) / screen.width + '*screenSizeX+screenOriginX';
  var newY = (winRect.y - screen.y) / screen.height + '*screenSizeY+screenOriginY';
  var newWidth = winRect.width / screen.width + '*screenSizeX';
  var newHeight = winRect.height / screen.height + '*screenSizeY';

  throwPrev = slate.operation('throw', {
    x: newX,
    y: newY,
    width: newWidth,
    height: newHeight,
    screen: 'prev'
  });
  win.doOperation(throwPrev);
};

var lefthalf = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX/2',
  height: 'screenSizeY'
});

var righthalf = slate.operation('move', {
  x: 'screenOriginX+screenSizeX/2',
  y: 'screenOriginY',
  width: 'screenSizeX/2',
  height: 'screenSizeY'
});

var tophalf = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX',
  height: 'screenSizeY/2'
});

var bottomhalf = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY+screenSizeY/2',
  width: 'screenSizeX',
  height: 'screenSizeY/2'
});

var mobile = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: '320',
  height: '568'
});

var phablet = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: '414',
  height: '736'
});

var tablet = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: '1024',
  height: '768'
});

var desktop = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: '1280',
  height: '800'
});

var large = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: '1440',
  height: '900'
});

var fullhd = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: '1920',
  height: '1080'
});


/* Key configurations
====================================================================== */

var hyper = ':shift,ctrl,alt,cmd';
var hyperModal = hyper + ',s:toggle';


/* default configs
====================================================================== */

slate.configAll({
  checkDefaultsOnLoad: true,
  defaultToCurrentScreen: true,
  focusCheckWidthMax: 3000,
  modalEscapeKey: 'esc',
  nudgePercentOf: 'screenSize',
  resizePercentOf: 'screenSize',
  secondsBetweenRepeat: 0.1,
  windowHintsDuration: 5,
  windowHintsFontColor: '0;255;0;1.0',
  windowHintsFontName: 'Menlo',
  windowHintsFontSize: 60,
  windowHintsHeight: 72,
  windowHintsIgnoreHiddenWindows: false,
  windowHintsShowIcons: true,
  windowHintsSpread: true,
  windowHintsWidth: 72
});


/* more key bindings
====================================================================== */

slate.bind('tab' + hyper, hint, false);
slate.bind('g' + hyper, grid, false);

// most important apps on easy accesible keys
slate.bind('i' + hyper, iterm, false);
slate.bind('c' + hyper, chrome, false);
slate.bind('x' + hyper, firefox, false);
slate.bind('m' + hyper, mail, false);
slate.bind('f' + hyper, fork, false);
slate.bind('t' + hyper, things, false);

// movements in modal mode with m
slate.bind('h' + hyperModal, lefthalf, false);
slate.bind('l' + hyperModal, righthalf, false);
slate.bind('k' + hyperModal, tophalf, false);
slate.bind('j' + hyperModal, bottomhalf, false);
slate.bind('1' + hyperModal, mobile, false);
slate.bind('2' + hyperModal, phablet, false);
slate.bind('3' + hyperModal, tablet, false);
slate.bind('4' + hyperModal, desktop, false);
slate.bind('5' + hyperModal, large, false);
slate.bind('6' + hyperModal, fullhd, false);

slate.bind('space' + hyperModal, fullscreen, false);
slate.bind('f' + hyperModal, fullheight, false);
slate.bind('right' + hyperModal, resizeToRight, false);
slate.bind('down' + hyperModal, resizeToBottom, false);
slate.bind(']' + hyperModal, throwNext, false);
slate.bind('[' + hyperModal, throwPrev, false);

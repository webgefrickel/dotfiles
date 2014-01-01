/* global slate: true */
/* global screenSizeX: true */
/* global screenSizeY: true */
/* global screenOriginX: true */
/* global screenOriginY: true */


/* default configs
====================================================================== */

slate.configAll({
  'checkDefaultsOnLoad': true,
  'defaultToCurrentScreen': true,
  'focusCheckWidthMax': 3000,
  'modalEscapeKey': 'esc',
  'nudgePercentOf': 'screenSize',
  'resizePercentOf': 'screenSize',
  'secondsBetweenRepeat': 0.1,
  'windowHintsDuration': 5,
  'windowHintsFontColor': '0;255;0;1.0',
  'windowHintsFontName': 'Menlo',
  'windowHintsFontSize': 60,
  'windowHintsHeight': 72,
  'windowHintsIgnoreHiddenWindows': false,
  'windowHintsShowIcons': true,
  'windowHintsSpread': true,
  'windowHintsWidth': 72
});


/* operations
====================================================================== */

// show the overlay hints for applications
var hint = slate.operation('hint', {
  'characters': 'jkl;asdfqwertyuiop[]zxcvbnm,'
});


// custom resize grids for all monitors 6x4
var grid = slate.operation('grid', {
  'padding': 10,
  'grids': {
    '0': {
      'width': 12,
      'height': 8
    },
    '1': {
      'width': 12,
      'height': 8
    },
    '2': {
      'width': 12,
      'height': 8
    }
  }
});


// ultrafast application-switching
var iterm = slate.operation('focus', { 'app': 'iTerm' });
var chrome = slate.operation('focus', { 'app': 'Google Chrome' });
var mail = slate.operation('focus', { 'app': 'Mail' });
var fork = slate.operation('focus', { 'app': 'ForkLift' });
var ical = slate.operation('focus', { 'app': 'iCal' });
var fox = slate.operation('focus', { 'app': 'Firefox' });


var fullscreen = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': 'screenSizeX',
  'height': 'screenSizeY'
});

var lefthalf = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': 'screenSizeX/2',
  'height': 'screenSizeY'
});

var righthalf = slate.operation('move', {
  'x': 'screenOriginX+screenSizeX/2',
  'y': 'screenOriginY',
  'width': 'screenSizeX/2',
  'height': 'screenSizeY'
});

var tophalf = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': 'screenSizeX',
  'height': 'screenSizeY/2'
});

var bottomhalf = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY+screenSizeY/2',
  'width': 'screenSizeX',
  'height': 'screenSizeY/2'
});

var mobile = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': '480',
  'height': 'screenSizeY'
});

var tablet = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': '1024',
  'height': '768'
});

var desktop = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': '1280',
  'height': '800'
});

var fullhd = slate.operation('move', {
  'x': 'screenOriginX',
  'y': 'screenOriginY',
  'width': '1920',
  'height': '1080'
});


/* Key bindings
====================================================================== */

var hyper = ':shift,ctrl,alt,cmd';
var hyperModal = hyper + ',s:toggle';

slate.bind('tab' + hyper, hint, false);
slate.bind('g' + hyper, grid, false);

// most important apps on easy accesible keys
slate.bind('q' + hyper, iterm, false);
slate.bind('w' + hyper, chrome, false);
slate.bind('e' + hyper, mail, false);
slate.bind('r' + hyper, fork, false);
slate.bind('t' + hyper, ical, false);

// movements in modal mode with m
slate.bind('h' + hyperModal, lefthalf, false);
slate.bind('l' + hyperModal, righthalf, false);
slate.bind('k' + hyperModal, tophalf, false);
slate.bind('j' + hyperModal, bottomhalf, false);
slate.bind('1' + hyperModal, mobile, false);
slate.bind('2' + hyperModal, tablet, false);
slate.bind('3' + hyperModal, desktop, false);
slate.bind('4' + hyperModal, fullhd, false);
slate.bind('space' + hyperModal, fullscreen, false);


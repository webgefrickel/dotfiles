module.exports = {
  config: {
    fontSize: 12,
    fontFamily: 'Hack, Inconsolata, Menlo, monospace',
    cursorShape: 'BLOCK',

    bell: false,
    windowSize: [ 900, 600 ],
    padding: '4px 4px 0',

    // use solarized dark colors
    cursorColor: '#839496',
    backgroundColor: '#002b36',
    foregroundColor: '#839496',
    borderColor: '#073642',
    colors: [
      '#073642',
      '#dc322f',
      '#859900',
      '#b58900',
      '#268db2',
      '#d33682',
      '#2aa198',
      '#eee8d5',
      '#002b36',
      '#cb4b16',
      '#586e75',
      '#657b83',
      '#839496',
      '#6c71c4',
      '#93a1a1',
      '#fdf6e3'
    ],

    // custom css, better text, no border/margins/rounded stuff
    css: `
      * {
        -webkit-font-feature-settings: "liga" on, "calt" on, "dlig" on !important;
        text-rendering: optimizeLegibility !important;
        font-weight: 500;
      }

      .hyperterm_main {
        border: 0;
        border-radius: 0;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: `
      @media (-webkit-max-device-pixel-ratio: 1.3), (max-resolution: 120dpi) {
        x-screen {
          -webkit-font-smoothing: subpixel-antialiased !important;
        }
      }
    `,

    // plugins config
    hyperclean: {
      hideTabs: true,
      hideFirstTabBorder: true
    }
  },

  plugins: [
    'hyperclean',
    'hyperterm-1password'
  ]

};

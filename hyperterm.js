module.exports = {
  config: {
    fontSize: 12,
    fontFamily: 'Hack, Inconsolata, Menlo, monospace',
    cursorShape: 'BLOCK',

    bell: false,
    windowSize: [ 900, 600 ],
    padding: '4px 4px 0',

    // use hybrid colors
    cursorColor: '#26fcff',
    backgroundColor: '#1d1f21',
    foregroundColor: '#c5c8c6',
    borderColor: '#1d1f21',
    colors: [
      '#282a2e',
      '#a54242',
      '#8c9440',
      '#de935f',
      '#5f819d',
      '#85678f',
      '#5e8d87',
      '#707880',
      '#373b41',
      '#cc6666',
      '#b5bd86',
      '#f0c674',
      '#81a2be',
      '#b294bb',
      '#8abeb7',
      '#c5c8c6'
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

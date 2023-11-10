// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/*_web.ex",
    "../lib/*_web/**/*.*ex"
  ],
  theme: {
    extend: {
      future: {
        hoverOnlyWhenSupported: true
      },
      width: {
        '76': '19rem',
        '84': '21rem',
        '108': '27rem'
      },
      height: {
               sm: '16rem',
               md: '32rem',
               lg: '34rem',
               xl: '38rem',
              },
      screens: {
        'sm' : '330px',
        'md' : '545px',
        'tablet': '650px',
        'lg' : '844px',
        'xl' : '1200px',
        // "btn" : ""
      },
      fontFamily: {
        inter: ["Inter"],
        cormorant: ["Cormorant SC"],
        rainbow: ["Over the Rainbow"]
      },
      colors: {
        primary: "#F4F1EA",
        secondary: "#3B4021",
        secondary_dark: "#1D1F11",
      },
      keyframes: {
        grow: {
          '0%': { transform: 'scale(1)'},
          '100%': { transform: 'scale(1.5)'}
        },
        pulse2: {
          '0%': {transform: 'scale(1)'},
          '10%': {transform: 'scale(1.3)'},
          '20%': {transform: 'scale(1.6)'},
          '30%': {transform: 'scale(1.3)'},
          '40%': {transform: 'scale(1.6)'},
          '50%': {transform: 'scale(1.3)'},
          '60%': {transform: 'scale(1.6)'},
          '70%': {transform: 'scale(1.3)'},
          '80%': {transform: 'scale(1.6)'},
          '90%': {transform: 'scale(1.3)'},
          '100%': {transform: 'scale(1)'},
        },
        wave: {
          '0%': { transform: 'rotate(0.0deg)' },
          '10%': { transform: 'rotate(14deg)' },
          '20%': { transform: 'rotate(-8deg)' },
          '30%': { transform: 'rotate(14deg)' },
          '40%': { transform: 'rotate(-4deg)' },
          '50%': { transform: 'rotate(10.0deg)' },
          '60%': { transform: 'rotate(0.0deg)' },
          '100%': { transform: 'rotate(0.0deg)' },
        },
        move: {
            "0%": { transform: 'translateX(-0%)' },
            "100%": { transform: 'translateX(-100%)'},
        },
        move2: {
          '0%': {
            transform: 'translateX(0%)'
          },
          '50%': {
            transform: 'translateX(100%)'
          },
          '51%': {
            transform: 'translateX(-100%)'
          },
          '100%': {
            transform: 'translateX(0%)'
          }
        },
        slide: {
          '0%': {
            transform: 'translate(0%)'
          },
          '100%': {
            transform: 'translate(-100%)'
          }
        }
      },
        animation: {
          'wave': 'wave 2s linear infinite',
          'move-text': "move 80s linear infinite",
          'move-text-fast': "move 30s linear infinite",
          'move-text2': "move2 20s linear infinite",
          'grow': "grow 1s linear",
          'pulse2': "pulse2 8s linear infinite",
          'slide': "slide 80s linear infinite"
      }
      //  .animation-container {
      //    animation: slide 80s linear infinite; /* Adjust the duration (10s in this case) as needed */
      //    white-space: nowrap; /* Prevents the text from wrapping */
      // }

    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({addVariant}) => addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])),
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, "./vendor/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).map(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
        })
      })
      matchComponents({
        "hero": ({name, fullPath}) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": theme("spacing.5"),
            "height": theme("spacing.5")
          }
        }
      }, {values})
    })
  ]
}

;(function(window) {

  var svgSprite = '<svg>' +
    '' +
    '<symbol id="icon-medicine-bottle" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M860.263959 400.243655c-5.19797-93.563452-51.979695-114.35533-88.365482-129.949239-20.791878-10.395939-31.187817-15.593909-36.385787-36.385787h20.791879V67.573604c0-36.385787-31.187817-67.573604-67.573605-67.573604H335.269036C298.883249 0 267.695431 31.187817 267.695431 67.573604v171.532995h20.791879c-5.19797 15.593909-15.593909 25.989848-36.385787 31.187817-31.187817 15.593909-77.969543 36.385787-88.365482 124.751269v499.005076c0 72.771574 57.177665 129.949239 129.949238 129.949239h436.629442c72.771574 0 129.949239-57.177665 129.949238-129.949239V415.837563v-15.593908zM335.269036 51.979695h353.461928c10.395939 0 15.593909 5.19797 15.593909 15.593909v114.35533H319.675127V67.573604c0-10.395939 5.19797-15.593909 15.593909-15.593909zM215.715736 447.025381h322.274112v395.045685H215.715736V447.025381z m514.598985 524.994924H293.685279c-41.583756 0-77.969543-36.385787-77.969543-77.969544v-5.197969h379.451777V395.045685H220.913706c5.19797-51.979695 25.989848-62.375635 57.177665-72.771573 25.989848-10.395939 62.375635-25.989848 67.573604-83.167513H683.532995c5.19797 51.979695 41.583756 72.771574 67.573604 83.167513 31.187817 15.593909 51.979695 25.989848 57.177665 88.365482v488.609137c0 41.583756-31.187817 72.771574-77.969543 72.771574z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '</svg>'
  var script = function() {
    var scripts = document.getElementsByTagName('script')
    return scripts[scripts.length - 1]
  }()
  var shouldInjectCss = script.getAttribute("data-injectcss")

  /**
   * document ready
   */
  var ready = function(fn) {
    if (document.addEventListener) {
      if (~["complete", "loaded", "interactive"].indexOf(document.readyState)) {
        setTimeout(fn, 0)
      } else {
        var loadFn = function() {
          document.removeEventListener("DOMContentLoaded", loadFn, false)
          fn()
        }
        document.addEventListener("DOMContentLoaded", loadFn, false)
      }
    } else if (document.attachEvent) {
      IEContentLoaded(window, fn)
    }

    function IEContentLoaded(w, fn) {
      var d = w.document,
        done = false,
        // only fire once
        init = function() {
          if (!done) {
            done = true
            fn()
          }
        }
        // polling for no errors
      var polling = function() {
        try {
          // throws errors until after ondocumentready
          d.documentElement.doScroll('left')
        } catch (e) {
          setTimeout(polling, 50)
          return
        }
        // no errors, fire

        init()
      };

      polling()
        // trying to always fire before onload
      d.onreadystatechange = function() {
        if (d.readyState == 'complete') {
          d.onreadystatechange = null
          init()
        }
      }
    }
  }

  /**
   * Insert el before target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var before = function(el, target) {
    target.parentNode.insertBefore(el, target)
  }

  /**
   * Prepend el to target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var prepend = function(el, target) {
    if (target.firstChild) {
      before(el, target.firstChild)
    } else {
      target.appendChild(el)
    }
  }

  function appendSvg() {
    var div, svg

    div = document.createElement('div')
    div.innerHTML = svgSprite
    svgSprite = null
    svg = div.getElementsByTagName('svg')[0]
    if (svg) {
      svg.setAttribute('aria-hidden', 'true')
      svg.style.position = 'absolute'
      svg.style.width = 0
      svg.style.height = 0
      svg.style.overflow = 'hidden'
      prepend(svg, document.body)
    }
  }

  if (shouldInjectCss && !window.__iconfont__svg__cssinject__) {
    window.__iconfont__svg__cssinject__ = true
    try {
      document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
    } catch (e) {
      console && console.log(e)
    }
  }

  ready(appendSvg)


})(window)
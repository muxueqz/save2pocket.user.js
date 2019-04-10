# ==UserScript==
# @name         Save to Pocket
# @icon         https://getpocket.com/a/i/pocketlogo.svg
# @namespace    http://tampermonkey.net/
# @version      1.0.0
# @description  Save page to pocket by userscript. Click your script manager's menu and press R or push the button.
# @author       muxueqz
# @include      *
# @run-at       document-start
# @grant        GM_registerMenuCommand
# @grant        GM_xmlhttpRequest
# @grant        GM_log
# @connect      *
# ==/UserScript==
GM_registerMenuCommand '+ Pocket', (->

  t = document
  n = t.location.href
  r = t.title
  GM_xmlhttpRequest
    method: 'POST'
    timeout: 5000
    # url: 'https://getpocket.com/b/r4.js?h=' + i + '&u=' + encodeURIComponent(n) + '&t=' + encodeURIComponent(r)
    url: 'https://getpocket.com/a/x/itemAction.php'
    name: 'add_to_pocket.txt'
    data: 'action=add&url=' + encodeURIComponent(n) + '&formCheck=a8ea5cf2e69c2b2415b07ce9fea03214'
    # data: 'action=add&url=http%3A%2F%2Fmuxueqz.coding.me%2F%3Fv3&formCheck=' + i
    headers: {
       "Content-Type": "application/x-www-form-urlencoded"
     },
    # onload: ->
      # eval @responseText
      # return
    onerror: (error, details) ->
      GM_log error, details
      return
  return
), 'r'

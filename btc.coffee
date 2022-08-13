command: "/usr/bin/curl -s https://api.coinbase.com/v2/prices/spot?currency=USD"

refreshFrequency: 60000 #ms

style: """
  bottom: -5px
  right: 5px
  color: #fff
  font-family: 'Oswald', sans-serif;
  opacity: .5

  table
    border-collapse: collapse
    table-layout: fixed
    -webkit-font-smoothing: antialiased
    -moz-osx-font-smoothing: grayscale

  td
    font-size: 46px
    font-weight: 700
    overflow: hidden
    text-shadow: 0 0 1px rgba(#000, 0.5)

"""

update: (output, domEl) ->
  res  = JSON.parse(output)
  json = res.data.amount
  split = json.split(".", 1)
  replace = split.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')
  price = replace.slice(0,4)
  
  $domEl = $(domEl)
  $domEl.find('#price').text ''+price+'k'

render: (o) -> """
  <table>
    <tr>
      <td>$<span id='price'></span></td>
    </tr>
  </table>
"""

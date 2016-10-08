local JSON = require('json')

function jsonResponse (opts)
  opts = opts or {}

  return function (req, res, nxt)
    function res:json (tbl)
      res:setHeader('Content-Type', 'application/json')
      res:finish(JSON.stringify(tbl, opts))
    end

    nxt()
  end
end

return jsonResponse

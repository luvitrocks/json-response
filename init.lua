local JSON = require('json')

function jsonResponse (opts)
  opts = opts or {}

  return function (req, res, nxt)
    function res:json (tbl)
      if not res.headers['Content-Type'] then
        res:setHeader('Content-Type', 'application/json')
      end

      res:finish(JSON.stringify(tbl, opts))
    end

    nxt()
  end
end

return jsonResponse

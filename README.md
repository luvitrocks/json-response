# json-response

> JSON pretty-printed response middleware for [Utopia](https://github.com/luvitrocks/utopia) and [Luvit.io](https://luvit.io).

## Install

```bash
lit install voronianski/json-response
```

## Example

```lua
local Utopia = require('utopia')
local jsonResponse = require('json-response')

local app = Utopia:new()

app:use(jsonResponse())

app:use(function (req, res) 
  res:json({ foo = 'bar' })
end)
```

## API

### `jsonResponse(options)`

### Options

Optional table is passed directly to Luvit's [`json.stringify` function](https://luvit.io/api/json.html#json_json_stringify_value_state) and [dkjson](http://dkolf.de/src/dkjson-lua.fsl/wiki?name=Documentation) which it uses internally:

- `indent` - when indent (a boolean) is set, the created string will contain newlines and indentations. Otherwise it will be one long line.

- `keyorder`  - keyorder is an array to specify the ordering of keys in the encoded output. If an object has keys which are not in this array they are written after the sorted keys.

- `level` - this is the initial level of indentation used when indent is set. For each level two spaces are added. When absent it is set to `0`.

- `buffer` - buffer is an array to store the strings for the result so they can be concatenated at once. When it isn't given, the encode function will create it temporary and will return the concatenated result.

- `bufferlen` - when bufferlen is set, it has to be the index of the last element of buffer.

- `tables`
tables is a set to detect reference cycles. It is created temporary when absent. Every table that is currently processed is used as key, the value is `true`.

- `exception` - when exception is given, it will be called whenever the encoder cannot encode a given value. 

## License

MIT Licensed

Copyright (c) 2016 Dmitri Voronianski [dmitri.voronianski@gmail.com](mailto:dmitri.voronianski@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

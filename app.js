var ref = require('ref');
var ffi = require('ffi');

var stringCallback = ffi.Function('void', ['string', 'string']);

var lib = ffi.Library('./lib/libnode-d-sample.so',
    {
        'init': [ 'void', []],
        'shutdown': [ 'void', []],
        'ping': [ 'int', []],
        'sayHello': [ 'void', ['string', stringCallback]]
    });

console.log('Start.');

lib.init();

console.log(lib.ping());

lib.sayHello('Gabor', stringCallback.toPointer(function(err, result) {
    console.log('err: ' + err);
    console.log('result: ' + result);
}));

console.log('End.');

lib.shutdown();
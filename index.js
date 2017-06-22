import fetchWasm from './utils.js';

var instanceExports;
var offset;

var sortsAlgorithms = {};

var sortAlgorithmNames = [
    "bubbleSort"
];
var sortModel = {
    asc: 1,
    desc: 0
};

function algorithm() {
    if (instanceExports) {
        return sortsAlgorithms;
    }
    return fetchWasm('./wasm/algorithm.wasm', {}).then(instance => {
        instanceExports = instance.exports;
        offset = instanceExports.getArrayOffset();
        sortsAlgorithms = createSortAlgorithms();
        return sortsAlgorithms;
    });
}

function createSortAlgorithms() {
    let obj = {};
    sortAlgorithmNames.reduce((s, sortName) => {
        s[sortName] = createSortFunc(sortName);
    }, obj);
    return obj;
}

function createSortFunc(sortName) {
    return function(arr, flag) {
        let _arr = [];
        flag = flag || sortModel.desc;
        let mem = sort({ sortName: sortName, arr, flag });
        for (let o of mem) {
            _arr.push(o);
        };
        return _arr;
    }
}

function setArrayBuffer(arr) {
    let mem = new Uint32Array(instanceExports.memory.buffer, offset, arr.length);
    for (let i = 0; i < arr.length; i++) {
        mem[i] = arr[i];
    }
    return mem;
}

function sort({ sortName, arr, flag }) {
    let mem = setArrayBuffer(arr);
    instanceExports[sortName](arr.length, flag);
    return mem;
}


export { sortModel };
export default algorithm;

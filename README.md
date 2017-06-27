# WebAssembly sort algorithm compiled by C.

## Use

```
    import algorithm from './index.js';
    import {sortModel} from './index.js';

    // choose the sort algorithm. Currently, this lib only has bubble sort.
    const {bubbleSort} = await algorithm();

    // The second param is sort model. sortModel.asc, sortModel.desc.
    const result = bubbleSort([3124,246,1,23,6,7],sortModel.asc);
    console.log(result);
```

Currently, Only have bubble sort.
# WebAssembly sort algorithm compiled by C.

## Use

```
    import algorithm from './index.js';

    var {bubbleSort} = await algorithm();

    // The second param is sort model. 1：ascending, 0：descending.
    console.log(bubbleSort([3124,246,1,23,6,7],1))
```

Currently, Only have bubble sort.
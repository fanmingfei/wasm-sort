#include <stdbool.h>

int array[67108864];


int *getArrayOffset () {
  return &array[0]; 
}

bool check(int flag, int a,int b) {
    return flag == 1 ? a > b : a < b;
}

void bubbleSort (int len, int flag) {
  for (int i = 1; i <= len; i ++) {
    for (int j = 0; j < len - i; j ++) {
      if (check(flag,array[j],array[j+1])) {
        int tmp = array [j];
        array[j] = array[j + 1];
        array[j + 1] = tmp;
      }
    }
  }
}

// // 这个插入排序有 BUG
// void insertionSort (int len) {
//   for (int i = 1; i <= len; i ++) {
//     for (int j = 0; j < i; j ++) {
//       int tmp = array[i];
//       if (array[i] < array[j]) {
//         for (int z = i; z > j; z --) {
//           array[z] = array[z-1];
//         }
//         array[j] = tmp;
//       }
//     }
//   }
// }
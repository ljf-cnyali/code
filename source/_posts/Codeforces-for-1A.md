---
title: 'Codeforces for 1A'
categories:
  - Codeforces
  - math
abbrlink: 3629021587
mathjax: true
date: 2017-09-17 14:55:02
---

## 题目大意

有一个大小为n\*m的广场，我们需要用a\*a的石块来覆盖整个广场。(貌似Markdown炸了，所以没有用Markdown)

有一个大小为n\*m的广场，我们需要用a\*a的石块来覆盖整个广场。

石块不可以切割，但可以覆盖比广场更大的表面，但广场必须被覆盖，石块的两边必须要平行于广场的两边。

求需要的石块数。

<!--more-->

## 题目分析
因为石块只有在依次排序才是所需最小的(易证)，所以我们只需要计算出依次排序需要的石块数。

## AC代码

```cpp
#include<bits/stdc++.h>

using namespace std;

#define REP(i, a, b) for ( int i = (a), _end_ = (b); i <= _end_; ++ i )
#define mem(a) memset ( (a), 0, sizeof (a) )
#define str(a) strlen (a)

const int maxn = 10000;

int main() {
    long long n, m, a;
    while(cin >> n >> m >> a ) {
        long long ans = ((n + a - 1) / a) * ((m + a - 1) / a);
        cout << ans << endl;
    }
    return 0;
}
```

---
title: '最近公共祖先:LCA倍增算法'
categories:
  - LCA
  - 倍增
abbrlink: 2785383444
date: 2017-09-03 14:08:24
---

### 前言
LCA全称Least Common Ancestor,指的是最近(小)公共祖先,LCA有很多种算法，我们今天以倍增算法为例.

倍增算法是一种在线算法,可以用 $ O(n\ log_2\ n) $ 的时间复杂度求出任意两点的最近(小)公共祖先.

<!--more-->

倍增算法的步骤为以下几个:
* 从根节点开始dfs,求出每一个节点的深度$dis[i]$和父亲节点(我们用$anc[i][0]$)表示.
* 然后算出$i$节点的第$2^j$个祖先,存为$anc[i][j]$,计算方法为
* $anc[i][j]=anc[anc[i][j-1]][j-1]$
* 以上为预处理步骤
* 在做$LCA(x,y)$时,首先将两个点移到同一高度,然后同时上移,直到两点重合，这个点就是最近(小）公共祖先

### DFS

```C++
void dfs(int x) {
    for ( int i = Begin[x]; i; i = Next[i] ) { // 使用链式前向星进行存储
        int u = To[i]; // 当前结点
        if ( dis[u] ) continue ; // 如果深度不为0则表示已经搜索过了
        dis[u] = dis[x] + 1; // 当前结点的深度
        anc[u][0] = x; // 当前结点u的父亲为x
        dfs(u); // 搜索这个结点
    }
}
```

### 计算祖先

```C++
void JS() {
    REP(j, 1, 18) // 枚举2^j祖先编号
        REP(i, 1, n) // 枚举结点
            anc[i][j] = anc[anc[i][j - 1]][j - 1]; // 计算祖先
}
```

### LCA

```C++
int LCA(int x, int y) {
    if ( dis[x] < dis[y] ) swap(x, y); // x为深度更深的结点
    for ( int i = 18; i >= 0; -- i ) 
        if ( dis[anc[x][i]] >= dis[y] ) x = anc[x][i]; // 将x向上移动
    if ( x == y ) return x; // 如果当前点就是最近(小)公共祖先，就返回当前结点
    for ( int i = 18; i >= 0; -- i ) // 同时向上移动
        if ( anc[x][i] != anc[y][i] ) { // 如果x,y的父亲都不相同的话就同时向上移
            x = anc[x][i];
            y = anc[y][i];
        }
    return anc[x][0]; // 因为我们只看父亲相同吗，所以还要向上移一个结点
}
```

### 代码
我稍稍封装了一下，希望大家可以理解
```C++
/**************************************************************************
<  Author : ljfcnyali
<  Mail : lifcnyali@gmail.com
<  Copy Right
**************************************************************************/
#include<bits/stdc++.h>

using namespace std;

#define REP(i, a, b) for ( int i = (a), _end_ = (b); i <= _end_; ++ i )
#define mem(a) memset ( (a), 0, sizeof (a) )
#define str(a) strlen (a)

const int maxn = 1000010;

struct _LCA_ {
	int Next[maxn], To[maxn], Begin[maxn], e;
	int dis[maxn], anc[maxn][20], n;

	void INIT(int s, int n) {
		e = 0;
		this -> n = n;
		dis[s] = 1;
	}

	void add(int u, int v) {
		To[++ e] = v; 
		Next[e] = Begin[u];
		Begin[u] = e;
	}

	void dfs(int x) {
		for ( int i = Begin[x]; i; i = Next[i] ) {
			int u = To[i];
			if ( dis[u] ) continue ;
			dis[u] = dis[x] + 1;
			anc[u][0] = x;
			dfs(u);
		}
	}

	void JS() {
		REP(j, 1, 18)
			REP(i, 1, n)
				anc[i][j] = anc[anc[i][j - 1]][j - 1];
	}

	int LCA(int x, int y) {
		if ( dis[x] < dis[y] ) swap(x, y);
		for ( int i = 18; i >= 0; -- i ) 
			if ( dis[anc[x][i]] >= dis[y] ) x = anc[x][i];
		if ( x == y ) return x;
		for ( int i = 18; i >= 0; -- i )
			if ( anc[x][i] != anc[y][i] ) {
				x = anc[x][i];
				y = anc[y][i];
			}
		return anc[x][0];
	}
}Run;

int main() {
	int n, m, s;
	scanf("%d%d%d", &n, &m, &s);
	Run.INIT(s, n);		
	REP(i, 1, n - 1) {
		int u, v;
		scanf("%d%d", &u, &v);
		Run.add(u, v);
		Run.add(v, u);
	}
	Run.dfs(s);
	Run.JS();
	REP(i, 1, m) {
		int u, v;
		scanf("%d%d", &u, &v);
		printf("%d\n", Run.LCA(u, v));
	}
	return 0;
}
```

### 后记
接下来的几篇博文我将会介绍其它几种LCA算法，记得关注哦!!!

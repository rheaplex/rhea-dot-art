---
title: "Dogecode"
image: "/images/sierpinski.png"
type: "page"
---

![A Sierpinkski triangle rendered in asterisks in a computer terminal from a program at a Dogecoin address](/images/sierpinski.png)

**Dogecode, 2014, Python code and Dogeparty tokens**
Cryptographic asset tokens can represent [all kinds of things](https://www.reddit.com/r/xdp/comments/2dmnsi/list_of_possible_ways_to_use_tokens/).

Including computer programs.

Dogecode takes computer programs in the [Brainfuck](http://en.wikipedia.org/wiki/Brainfuck) programming language (chosen for simplicity of encoding):

```
++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.
```
and translates them into a csv file of token amounts using `dcc`:

```
INCB,8
JFOR,1
INCP,1
INCB,4
JFOR,1
INCP,1
INCB,2
INCP,1
INCB,3
INCP,1
...
```

which are then sent to a Dogeparty address (slowly) as a series of token transfer transactions using `dcsend`:

```
Sending lots of tokens. Make sure you really want to do this.
Waiting for token state to synch
Row 1: INCB,8
Waiting for token state to synch...........
Row 2: JFOR,1
Waiting for token state to synch.............
Row 3: INCP,1
Waiting for token state to synch........
Row 4: INCB,4
Waiting for token state to synch..................
Row 5: JFOR,1
Waiting for token state to synch.......................
Row 6: INCP,1
Waiting for token state to synch.......................
Row 7: INCB,2
Waiting for token state to synch......
Row 8: INCP,1
Waiting for token state to synch......
Row 9: INCB,3
Waiting for token state to synch......
Row 10: INCP,1
Waiting for token state to synch.....................
Row 11: INCB,3
Waiting for token state to synch..............
Row 12: INCP,1
Waiting for token state to synch....
```

The transactions encode the program on the [address](http://dogepartychain.info/address/DCvDS9g9VUZ94MSLbWi4zWRtxHrXeEctZ3), which can then be fetched and run as seen at the top of this post using `dcrun`:

```
$ dcrun -u rpcuser -w rpcpassword DCvDS9g9VUZ94MSLbWi4zWRtxHrXeEctZ3
Hello World!
```

There's also an easier to use runner that uses a web API rather than requiring a local dogepartyd instance to be running which will fetch the program encoded as Dogeparty tokens at the specified address (DCvD...) and run it locally:

```
$ dcrunw DCvDS9g9VUZ94MSLbWi4zWRtxHrXeEctZ3
Hello World!
```

Here's some addresses to try:

```
DCvDS9g9VUZ94MSLbWi4zWRtxHrXeEctZ3
DFZkhTXwAWW7PqBvVkohCFWobipqw3xmAn
DFibwNZvuJaHM9bD6x1WA63urkHiE4tWzF
DQuineX1BTF4ZD6DQxxsbUgVttmR4LvrdY
```

FROM ubuntu:latest AS base

RUN apt-get update && apt-get install -y stress-ng

FROM base AS ex1

# RUN <<EOF
# stress-ng --cpu 4 &
# EOF

CMD ["sh", "-c", "stress-ng --cpu 4 2>/dev/null &", "bash"]

# FROM base AS ex2
# FROM base AS ex3
# FROM base AS ex4
# FROM base AS ex5
# FROM base AS ex6
# FROM base AS ex7
# FROM base AS ex8
# FROM base AS ex9
# FROM base AS ex10
# FROM base AS ex11
# FROM base AS ex12
# FROM base AS ex13
# FROM base AS ex14
# FROM base AS ex15
# FROM base AS ex16
# FROM base AS ex17
# FROM base AS ex18
# FROM base AS ex19
# FROM base AS ex20
# FROM base AS ex21
# FROM base AS ex22
# FROM base AS ex23
# FROM base AS ex24
# FROM base AS ex25
# FROM base AS ex26
# FROM base AS ex27
# FROM base AS ex28
# FROM base AS ex29
# FROM base AS ex30
# FROM base AS ex31
# FROM base AS ex32
# FROM base AS ex33
# FROM base AS ex34
# FROM base AS ex35
# FROM base AS ex36
# FROM base AS ex37
# FROM base AS ex38
# FROM base AS ex39
# FROM base AS ex40
# FROM base AS ex41
# FROM base AS ex42
# FROM base AS ex43
# FROM base AS ex44
# FROM base AS ex45
# FROM base AS ex46
# FROM base AS ex47
# FROM base AS ex48
# FROM base AS ex49
# FROM base AS ex50
